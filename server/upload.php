<?php
//required dir
//upload_tmp
//thumbnail
//upload
//rubbish

//need to change php's default setting of upload_max_filesize from 2M to 16M
include_once 'util.php';
include_once 'db_con.php';

function diffImage($f1, $f2){

	$im1 = imagecreatefromjpeg($f1);
	if(!$im1)
		$im1 = imagecreatefrompng($f1);

	$im2 = imagecreatefromjpeg($f2);
	if(!$im2)
		$im2 = imagecreatefrompng($f2);
	//either jpeg or png
	if(!$im1 or !$im2)
		return 255; //default is different

	list($width, $height) = getimagesize($f1);
	$diff = 0;
	$sample = 10;
	for($i = 1 ; $i <= $sample ; $i++){
		$x = rand(0, $width - 1);
		$y = rand(0, $height - 1);
		$rgb1 = imagecolorat($im1, $x, $y);
		$rgb2 = imagecolorat($im2, $x, $y);
		$r1 = ($rgb1 >> 16) & 0xFF;
		$r2 = ($rgb2 >> 16) & 0xFF;
		$g1 = ($rgb1 >> 8) & 0xFF;
		$g2 = ($rgb2 >> 8) & 0xFF;
		$b1 = $rgb1 & 0xFF;
		$b2 = $rgb2 & 0xFF;
		$diff += abs($r1 - $r2);
		$diff += abs($g1 - $g2);
		$diff += abs($b1 - $b2);
	}
	$diff /= $sample;
	return $diff;
}

ini_set( "display_errors", 0);

$prefix = $_GET['prefix'];

$path = '../' . $prefix;
if($prefix == 'hjx')
	$path = '..';

$uploaddir = $path . '/upload_tmp/';

list($usec, $sec) = explode(" ", microtime());
list($userid, $username) = explode("_____", $_FILES['userfile']['name']);
$file = basename($userid . "___" . $sec . "___.jpg");



//echo $file;
$uploadfile = $uploaddir . $file;
if(move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
	//success
	list($width, $height, $type, $attr)= getimagesize($uploadfile);	
	if($width > $height + 5){
		//rotate image
		$source = imagecreatefromjpeg($uploadfile);
		if(!$source)
			$source = imagecreatefrompng($uploadfile);
		$rotate = imagerotate($source, 270, 0);
		imagejpeg($rotate, $uploadfile);
		imagedestroy($rotate);
	}
	//change image size to be smaller than 136220bytes, a bug of three20 PS: not really, just a parameter :(...
	//$current_size = filesize($uploadfile);
	list($width, $height) = getimagesize($uploadfile);
	if((int)($width * $height) > (4 * 640 * 960)){ //allow larger size for iPad
		//reduce size
		$percent = sqrt(0.95 * 4 * 640.0 * 960.0 / ((double)$width * $height));
		// // Get new dimensions
		$new_width = $width * $percent;
		$new_height = $height * $percent;
		// Resample
		$image_new = imagecreatetruecolor($new_width, $new_height);
		$image = imagecreatefromjpeg($uploadfile);
		if(!$image)
			$image = imagecreatefrompng($uploadfile);
		imagecopyresampled($image_new, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
		// Output
		imagejpeg($image_new, $uploadfile);
		imagedestroy($image_new);
		//$current_size = filesize($uploadfile);
	}
	//get md5hash
	$md5 = md5_file($uploadfile);
	global $link;
	
	$current_size = filesize($uploadfile);
	$result = mysqli_query($link, "SELECT id FROM picture WHERE size = '" . $current_size . "' AND hash ='" . $md5 . "'");
	$row = mysqli_fetch_assoc($result);
	
	list($width, $height) = getimagesize($uploadfile);

	
	if(!$row){

		//now check image diff with same width and height, check upload / upload_tmp
		$r2 = mysqli_query($link, "SELECT * FROM picture WHERE height = '" . $height . "' AND width ='" . $width . "' order by uploadTime desc LIMIT 400");

		$diff = 0;
		while ($row2 = mysqli_fetch_assoc($r2)) {
			if($row2['type']  == 2)
				$f2 = $path . '/upload/' . $row2['imageId'];
			else if($row2['type']  == 0)
				$f2 = $path . '/upload_tmp/' . $row2['imageId'];
			else
				continue;

			if(diffImage($uploadfile, $f2) < 25){
				$diff = 1;
				break;
			}
		}

		if($diff == 0){
			echo "Image uploaded successfully!\nIt is now under review before publicly available\nExpect 1-48 hours delay";
			$image_new = imagecreatetruecolor(100, 150);
			$image = imagecreatefromjpeg($uploadfile);
			if(!$image)
				$image = imagecreatefrompng($uploadfile);
			imagecopyresampled($image_new, $image, 0, 0, 0, 0, 100, 150, $width, $height);
			// Output
			imagejpeg($image_new, $path . '/thumbnail/' . $file);
			imagedestroy($image_new);
			mysqli_query($link, "INSERT INTO picture (id, userId, hash, height, width, size, creationTime, generateTime, url) VALUES ('" . $file . "', '" . $userid . "', '" . $md5 . "', '" . $height . "', '" . $width . "', '" . $current_size . "', '" . $sec . "', '" . $sec . "','" .GetHttpUsr($file)."'");
			mysqli_close($link);
			return;
		}
	}
	

	echo "Sorry!\nSomeone has already uploaded the same image before:(\n\nTry a new one please ~";
	unlink($path . '/upload_tmp/' . $file); //simply delete the file
	//rename('../' . $prefix . '/upload_tmp/' . $file, '../' . $prefix . '/duplicate/' . $file);
	//mysql_query("INSERT INTO image (imageId, userId, hash, height, width, size, uploadTime, lastTime, type) VALUES ('" . $file . "', '" . $userid . "', '" . $md5 . "', '" . $height . "', '" . $width . "', '" . $current_size . "', '" . $sec . "', '" . $sec . "', '-3')");
	mysqli_close($link);

}else{
	echo "Uploading process failure\nPlease contact: bluesky.wnz@gmail.com\nTell us your device type, OS version and what type of network you are using";
}
?>

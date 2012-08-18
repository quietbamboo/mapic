<?php
include_once 'util.php';

function GetMylist($prefix, $userId){
	$link = mysqli_connect("localhost", "hjx_asian", "tsinghuang", $prefix ."_db");

	
	$result = $link->query("SELECT * FROM image where userId='" . $userId . "' ORDER BY uploadTime DESC LIMIT 2500");
	
	$baseurl = "http://" . $prefix . ".asianhots.com/";
	if($prefix == 'hjx')
		$baseurl = "http://iphone.dotaart.com/asian/";
	$i = 0;
	$liteStr = "";
	$username = "";
	while ($row = $result->fetch_array()){
		$type = $row['type'];
		if($type == -2 or $type == 0 or $type == 2){
		}else
			continue;


		if($username == ""){
			$name_res = $link->query("SELECT name FROM user WHERE id = '" . $row['userId'] . "'");
     			if(!$name_res){
      				$username = "Anonymous";
			}else{
				$name_row = $name_res->fetch_array();
       				$username = $name_row['name'];
				$name_res->close();
			}
		}

		if($liteStr != ""){
			$liteStr .= "_-_-_";
		}
		//lite list
		if($type == -2){
			$status = "\nSorry, this image is banned";
			$dir = "rubbish/";
		}else if($type == 0){
			$status = "\nThis image is in review";
			$dir = "upload_tmp/";
		}else if($type == 2){
			$status = "\nThis image is approved and published";
			$dir = "upload/";
		}

		$liteStr .= $baseurl . $dir;
		$liteStr .= $row['imageId'];
		$liteStr .= "-----";
		$liteStr .= $username;
		$liteStr .= $status;
		$liteStr .= "\nUploaded " . getAgo($row['uploadTime']);
		$liteStr .= "\nLike : " . $row['likes'] . "\nDislike : " . $row['dislikes'];
		$liteStr .= "\n" . $row['width'] . " X " . $row['height'] . "  size: " . ((int)($row['size']/1000))/1000 . "MB";

		$i++;
	}
	
	$result->close();

	$link->close();

	return $liteStr;
}

echo GetMylist($_GET['prefix'], $_POST['id']);
?>

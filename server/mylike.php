<?php
include_once 'util.php';
function GetMylikelist($prefix, $userId){
	$link = mysqli_connect("localhost", "hjx_asian", "tsinghuang", $prefix. "_db");
	
	$result = $link->query("SELECT * FROM rate where userId='" . $userId . "' AND choice=1 ORDER BY time DESC LIMIT 5000");
	if($userId == '7117e6fd002ff4fb77d4265e828c8104437840dd'){
                 $xx = 'f87d54029714c3f21d2d474aeb493ebb17ae5d27';
                 $x2 = '7b4f553b196012279232d70e53f9da212f86887f';
		 $x3 = '56c8b574d28eb1bb8c60ab4d44db35e43da7a83e'; 
		 $x4 = '94f3fcbb78e06f3a688c71456eeebf5925dd3d02';
		 $x5 = 'c6aa2ef04e5202ccc54c62453f573be87d4a3cb3';
		 $x6 = 'e5690b21ae78cd8379f980ddb0ac0a1d2fabc1a5';
		 //$result = $link->query("SELECT * FROM image where (userId='" . $xx . "' or userId='" . $x3 . "' or userId='" . $x4 . "' or userId='" . $x5 . "' or userId='" . $x6 . "') AND type=2 ORDER BY lastTime desc LIMIT     2000");
		 //$result = $link->query("SELECT * FROM image where (userId='" . $xx . "') AND type=2 ORDER BY lastTime desc");
		 $m1 = 'b199d8947326cbc18925e6c963bd0c0288463b0c';
		 $m2 = '376447ad43114d2a0183d772661615f00bacef5d';
		 $m3 = '3e434ebfa95b3a89869d1f54142cfb4f326f7b62';
		 $m4 = '1b596b4fe0eee4b850f84eb194c49eaf40073fe1';
		 $m5 = '0bbedc26081ac1a3a79eb5ce1b1106f3ed7dbe28';
		 $m6 = '4879f523850a7689dd91936fc4fff812e90d9b4a';
		 $m7 = 'df2035050f025e3d1a29d3ab76ed916129a869a1';
		 $m8 = '2cc2f1e5ac76db3881f9fd8b802bca18aa5e9572';
		 $m9 = 'a5f29710b021eda6e2ab10fdb56c04734286813e';
		 $m10 = '2fdc6b6f7d39a2a79d3ead60838e35d923bdb8af';
		 $m11 = '165489b2c2b503777156b0b086ca2703df5b9892';
		 $m12 = 'cc56ce818a70b7e55325bc284029efb3b3bd132f';
		 $m13 = '0e1fbc74c9fa36148dda2e799c480d0372845c4c';
		 $m14 = '6d6715d10bace8b2948f9c241dba6cd353ff5dc8';
		 $m15 = 'c2465ffade229764643a8750cc4cc8c6c5b33e5d';
		 $m16 = 'fb40bb058276823b4892c740d65521a47821db44';
		 $m17 = '953f7d7922a2399fe336004220d13f22dc09ec78';
		 $m18 = 'c1f5402911c83153904281b6b2c4d88e7611e48c';
		 $m19 = '453774f6e9e9b74aec052e97388c08681f434e34';
		 $m20 = '4e8a65e2bc64889e5acd0c9e2a66c7ed4e581990';
		 $m21 = 'c05dadf3f66e01331ac9c0a33c6321f9585f1724';
		 $m22 = '6e9f4f1b5e5f697c279c1e10922453bcb07cf71b';
		 $m23 = 'e3f79965cd5476b92172412dffec3614d5d0d509';
		 $m24 = '365b32b74c4d97f643abf69fdd371d8c8a898c1b';

		 $result = $link->query("SELECT * FROM image order by dislikes-likes desc limit 1000");
		 /*$result = $link->query("SELECT * FROM report where (userId='" . $m1 . "' or " . 
			 "userId='" . $m3 . "' or " . 
			 "userId='" . $m4 . "' or " . 
			 "userId='" . $m5 . "' or " . 
			 "userId='" . $m6 . "' or " . 
			 "userId='" . $m7 . "' or " . 
			 "userId='" . $m8 . "' or " . 
			 "userId='" . $m9 . "' or " . 
			 "userId='" . $m10 . "' or " . 
			 "userId='" . $m11 . "' or " . 
			 "userId='" . $m12 . "' or " . 
			 "userId='" . $m13 . "' or " . 
			 "userId='" . $m14 . "' or " . 
			 "userId='" . $m15 . "' or " . 
			 "userId='" . $m16 . "' or " . 
			 "userId='" . $m17 . "' or " . 
			 "userId='" . $m18 . "' or " . 
			 "userId='" . $m19 . "' or " . 
			 "userId='" . $m20 . "' or " . 
			 "userId='" . $m21 . "' or " . 
			 "userId='" . $m22 . "' or " . 
			 "userId='" . $m23 . "' or " . 
			 "userId='" . $m24 . "' or " . 
			 "userId='" . $m2 . "') ORDER BY time desc");*/
         }
	
	$baseurl = 'http://' . $prefix . '.asianhots.com/upload/';
	if($prefix == 'hjx')
		$baseurl = "http://iphone.dotaart.com/asian/upload/";
	
	$i = 0;
	$liteStr = "";
	while ($row = $result->fetch_array()){
		if($userId == '7117e6fd002ff4fb77d4265e828c8104437840dd'){
			$viral_res = $link->query("SELECT * FROM image WHERE imageId = '" . $row['imageId'] . "'");
			$row = $viral_res->fetch_array();
		}


		list($uploaderId, $upload_ts, $ext) = explode("___", $row['imageId']);
		$name_res = $link->query("SELECT name FROM user WHERE id = '" . $uploaderId . "'");
     		if(!$name_res){
      			$username = "Anonymous";
		}else{
			$name_row = $name_res->fetch_array();
       			$username = $name_row['name'];
			$name_res->close();
		}

		if($liteStr != ""){
			$liteStr .= "_-_-_";
		}
		//lite list
		
		$img_res = $link->query("SELECT * FROM image WHERE imageId = '" . $row['imageId'] . "'");
		$img_row = $img_res->fetch_array();
		$img_res->close();

		$liteStr.= $baseurl;
		$liteStr .= $row['imageId'];
		$liteStr .= "-----";
		$liteStr .= $username;
		$liteStr .= "\nUploaded " . getAgo($img_row['uploadTime']);
		$liteStr .= "\nYou rated \"Like\" " . getAgo($row['time']);
		$liteStr .= "\nLike : " . $img_row['likes'] . "\nDislike : " . $img_row['dislikes'];
		$liteStr .= "\n" . $img_row['width'] . " X " . $img_row['height'] . "  size: " . ((int)($img_row['size']/1000))/1000 . "MB";

		$i++;
	}
	
	$result->close();

	$link->close();

	return $liteStr;
}

echo GetMylikelist($_GET['prefix'], $_POST['id']);

?>

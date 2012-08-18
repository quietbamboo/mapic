<?php
include_once 'util.php';

function Rate($prefix, $id, $rated_file, $rate, $vip){
	if(strlen($id) < 10){
		return "ID less than 10 digits, not a valid device.";
	}

	if($rate == 1)
		$cs = "Like";
	else
		$cs = "Dislike";
	
	$con = mysqli_connect("localhost","hjx_asian","tsinghuang", $prefix. "_db");
	
	$rate_result = mysqli_query($con, "SELECT count(choice) FROM rate WHERE userId = '" . $id . "'");
	$rate_c_row = mysqli_fetch_assoc($rate_result);
	$rate_count = $rate_c_row['count(choice)'];
	
	$result = mysqli_query($con, "SELECT time, choice FROM rate WHERE userId = '" . $id . "' AND imageId ='" . $rated_file . "'");
	$row = mysqli_fetch_assoc($result);
	if(!$row){
		//can rate
		mysqli_query($con, "INSERT INTO rate (userId, imageId, choice, time, vip, type, counted) VALUES ('" . $id . "', '" . $rated_file . "', '" . $rate . "', '" . getCurrentSec() . "', '" . $vip . "', '0', '0')");
		$reply = "Success!\n\nYour rating (" . $cs . " X" . $vip . ") will be counted soon, check back later\n\nYou have rated " . (1+$rate_count) . " times in total";
	}else{
		//update old rate
		mysqli_query($con, "INSERT INTO rate (userId, imageId, choice, time, vip, type, counted) VALUES ('" . $id . "', '" . $rated_file . "', '" . $rate . "', '" . getCurrentSec() . "', '" . $vip . "', '0', '0') ON DUPLICATE KEY UPDATE time=" . getCurrentSec() . ", choice=" . $rate . ", counted=0");
		if($row['choice'] == 1)
			$cs2 = "Like";
		else
			$cs2 = "Dislike";
		$reply = "Successful update of rating\nYou previously rated " . getAgo($row['time']) . "\nYou previous choice: " . $cs2 . "\n\nYou current choice: " . $cs . " X" . $vip . "\n\nNotice that only the most recent rating will be recorded\n\nIn total, You have rated " . $rate_count . " times";
	}
	mysqli_close($con);
	echo $reply;
}

$prefix = $_POST['prefix'];
$id = $_POST['id'];
$rated_file = $_POST['filename'];
$rate = $_POST['rate'];
$vip = GetVipValue($prefix, $id, "rate");

echo Rate($prefix, $id, $rated_file, $rate, $vip);	

?>

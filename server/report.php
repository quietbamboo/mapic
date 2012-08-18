<?php
include_once 'util.php';

function report($prefix, $id, $reported_file, $vip){
	if(strlen($id) < 10){
		return "ID less than 10 digits, not a valid device.";
	}
	
	if($id == '7117e6fd002ff4fb77d4265e828c8104437840dd' or $id == '47229b1f20e4763df6383abf13b0d2de028988f5'){
		//my iphone 4
		//delete this file completely
		return delete_photo($prefix, $id, $reported_file, 0);
	}
	
	$con = mysqli_connect("localhost","hjx_asian","tsinghuang", $prefix. "_db", $con);
	

	$report_result = mysqli_query($con, "SELECT count(vip) FROM report WHERE userId = '" . $id . "'");
	$report_c_count = mysqli_fetch_assoc($report_result);
	$report_count = $report_c_count['count(vip)'];
	
	$result = mysqli_query($con, "SELECT time FROM report WHERE userId = '" . $id . "' AND imageId ='" . $reported_file . "'");
	$row = mysqli_fetch_assoc($result);
	if(!$row){
		//can report
		mysqli_query($con, "INSERT INTO report (userId, imageId, time, vip) VALUES ('" . $id . "', '" . $reported_file . "', '" . getCurrentSec() . "', '" . $vip . "')");
		$reply = "Thank you for reporting inappropriate images to us. We will check it soon.\n\nYour report is counted as " . $vip . " reports\n\nYou have reported " . (1+$report_count) . " times";
	}else{
		$reply = "Sorry!\n\nYou have already reported this image " . getAgo($row['time']) . " You don't need to report again.\n\nYou have reported " . $report_count . " times";
	}
	mysqli_close($con);
	return $reply;
}



$vip = GetVipValue($prefix, $id, "rate");
if($_POST['command'] == "Delete")
	echo delete_photo($_POST['prefix'], $_POST['id'], $_POST['filename'], $vip);
else
	//default report
	echo report($_POST['prefix'], $_POST['id'], $_POST['filename'], $vip);

?>

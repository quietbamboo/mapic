<?php

include_once('util.php');
include_once('db_con.php');

function GetImage($prefix, $imageId){
	
	$baseurl = "http://" . $prefix . ".asianhots.com/upload/";
	if($prefix == 'hjx')
		$baseurl = "http://iphone.dotaart.com/asian/upload/";

	global $link;
	$result = $link->query("SELECT * FROM picture WHERE id='" . $imageId . "'");
	
	$row = $result->fetch_assoc();
	$username ='';
	$name_res = $link->query("SELECT name FROM user WHERE id = '" . $row['userId'] . "'");
	if(!$name_res or count($name_res->fetch_array())==0){
		$username = "Anonymous";
	}else{
		$name_row = $name_res->fetch_array();
		$username = $name_row['name'];
		$name_res->close();
	}
	$row['userName']=$username;
	echo json_encode($row);	
	$result->close();
	$link->close();
}

GetImage($_GET['prefix'], $_GET['imageId']);

?>

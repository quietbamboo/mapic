<?php
include_once 'util.php';
include_once 'db_con.php';


function getImageList($lat,$lon,$r){
	$latfrom=$lat-$r;
	$latto=$lat+$r;
	$lonfrom=$lon-$r;
	$lonto=$lon+$r;
	$sql="select * from picture where latitude>".$latfrom." and latitude <".$latto." and longitude>".$lonfrom." and longitude<".$lonto;
	global $link;
	$result = $link->query($sql);
	while($list = $result->fetch_assoc()){
		$res[]=$list;
		$i++;
	}
	return json_encode($res);
}

$lat=$_GET['lat'];
$lon=$_GET['lon'];
$r=$_GET['r'];
if(!$r or $r<0){
	$r=0.1;
}
echo getImageList($lat,$lon,$r);

?>

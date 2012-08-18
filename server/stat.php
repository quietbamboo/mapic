<?php

include_once 'util.php';

function UpdateRank($prefix, $userId){

	$link = mysqli_connect("localhost", "hjx_asian", "tsinghuang", $prefix . "_db");
	
	//directly use visits in user table
//	$res = $link->query("SELECT visits FROM user WHERE userId='" . $userId . "'");
//	if(!$res){
	
	$visits = 0;

//	}else{
//		$res_c = $res->fetch_assoc();
//		$visits = $res_c['visits'];
//	}
	
	$r1 = $link->query("SELECT count(choice) FROM rate WHERE userId='" . $userId . "'");
	if(!$r1){
		$n1 = 0;
	}else{
		$n1_c = $r1->fetch_assoc();
		$n1 = $n1_c['count(choice)'];
	}

	$upload = 0;
	$r2 = $link->query("SELECT * FROM image WHERE userId='" . $userId . "'");
	while ($row = $r2->fetch_array()){
		if($row['type'] == -2)//band
			$upload -= 20;
		elseif($row['type'] == 0)//new upload
			$upload += 5;
		elseif($row['type'] == 2){//approved
			$upload += 20;
			$upload += $row['likes'];
			$upload -= $row['dislikes'];
			$upload -= (int)($row['reports'] / 5.0);
		}
	}

	$stmt = $link->stmt_init();
	$stmt->prepare("INSERT INTO rank (id, visits, rates, upload, lastUpdateTime) VALUES (?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE visits=?, rates=?, upload=?, lastUpdateTime=?");
	$currentSec = getCurrentSec();
	$stmt->bind_param('siiiiiiii', $userId, $visits, $n1, $upload, $currentSec, $visits, $n1, $upload, $currentSec);
	$stmt->execute();
	$stmt->close();
	
	$link->close();

}




function GetProfile($prefix, $id){


	$link = mysqli_connect("localhost", "hjx_asian", "tsinghuang", $prefix . "_db");
	
	$result = $link->query("SELECT count(id) FROM user");
	$res_c = $result->fetch_assoc();
	$n = $res_c['count(id)'];
	
	//welcome
	//echo '<div align="center"><font size="3pt" color=#FF2522>***************************************<BR>Welcome back!<BR>***************************************<BR></font></div>';

	//ah users link for review
	//if($prefix == 'hjx'){
	//	echo '<div align="center"><font size="3pt" color=#red><a href=\'http://goo.gl/Z2Mu\'>Asian Beauty Review</a><BR></font></div>';
	//}
	//personal profile
	$result = $link->query("SELECT * FROM user WHERE id='" . $id . "'");
	while ($row = $result->fetch_array()){
		//echo '<div align="center"><font size="3pt" color=#3C55FF>==============<BR>Personal profile<BR>==============<BR></font></div>';
		EchoSection('Name:', $row['name']);
		if(rand(0, 100) < 30){
			EchoHint('Hint: change name by connecting your device to iTunes');
		}
		//echo '<BR>';
		
		ShowAd();
		$profileUrl = GetBaseUrl($prefix) . 'stat.php?id=' . $id . '&prefix=' . $prefix . 
			'&command=' . $_GET['command'];
		AddFBLike($profileUrl);
		AddThis();

		EchoSection('Last visit:', getAgo($row['lastTime']));
		echo '<BR>';
		EchoSection('First visit:', getAgo($row['firstTime']));
		echo '<BR>';
		EchoSection('Devide ID:', $row['id']);
	}
	echo('<BR><BR>');


	//global rankings
	echo '<div align="center"><font size="3pt" color=#3C55FF>=================<BR>Global rankings<BR>=================<BR></font></div>';
	
	$item = "rates";
	$qstr = "SELECT uo.*, (SELECT  COUNT(*) FROM rank ui WHERE (ui." . $item . ") >= (uo." . $item . ")) AS r FROM rank uo WHERE id='" . $id . "'";
	$result = $link->query($qstr);
	while ($row = $result->fetch_array()){
		EchoSection('Ranking last update time:', getAgo($row['lastUpdateTime']));
		echo '<BR>';
		EchoSection('Total rating time:', $row['rates']);
		EchoSection('Ranking of all ' . $n . ' global users:', $row['r'] . ' Top ' . ((int)($row['r'] * 10000 / $n)) / 100.0 . '%');
		echo '<BR>';
	}
	
	$item = "visits";
	$qstr = "SELECT uo.*, (SELECT  COUNT(*) FROM user ui WHERE (ui." . $item . ") >= (uo." . $item . ")) AS r FROM user uo WHERE id='" . $id . "'";
	$result = $link->query($qstr);
	while ($row = $result->fetch_array()){
		EchoSection('Total visits:', $row['visits']);
		EchoSection('Ranking of all ' . $n . ' global users:', $row['r'] . ' Top ' . ((int)($row['r'] * 10000 / $n)) / 100.0 . '%');
		echo '<BR>';
	}
	
	$item = "upload";
	$qstr = "SELECT uo.*, (SELECT  COUNT(*) FROM rank ui WHERE (ui." . $item . ") >= (uo." . $item . ")) AS r FROM rank uo WHERE id='" . $id . "'";
	$result = $link->query($qstr);
	while ($row = $result->fetch_array()){
		EchoSection('Upload score:', $row['upload']);
		EchoSection('Ranking of all ' . $n . ' global users:', $row['r'] . ' Top ' . ((int)($row['r'] * 10000 / $n)) / 100.0 . '%');
		EchoHint('Upload Score=20*Approved-20*Banned+5*InReview+Sum(Likes)-Sum(Dislikes)-Sum(Reports)/5');
		echo '<BR>';
	}

	AddFBComment($profileUrl);
	ShowAd();
	
	EchoSection('Photo Album Selection', '');
	$qstr = 'select * from image where type=2 and userId="' . $id . '" order by lastTime desc limit 90';
	$result = $link->query($qstr);
	$c = 0;
	while ($row = $result->fetch_array()){
		echo GetImageLink($prefix, $row['imageId']) . "   ";
		if(++$c % 3 == 0)
			echo '<BR>';
	}


	$result->close();
	$link->close();
}

function GetTopDonator($prefix, $id){

	//welcome
	echo '<div align="center"><font size="3pt" color="red">***************************************<BR>Hall of Fame for VIPs<BR>***************************************<BR></font></div><BR>';
	
	//donate link
	ShowAd();
	echo '<div align="center"><font size="3pt" color=#red><a href=\'http://php.asianhots.com/paypal\'>Become VIP now<BR>(only available for v4.1.3+)<BR>Read more for VIP privileges</a><BR></font></div><BR><BR>';
	//echo '<div align="center"><font size="3pt" color=#red><a href=\'http://php.asianhots.com/paypal/buy.php?password=7117e6fd002ff4fb77d4265e828c8104437840dd&type=super\'>Success</a><BR></font></div>';
	//echo '<div align="center"><font size="3pt" color="gray">Coming soon ......</font><BR></div>';
	ShowVipList($prefix, $id, "Super Super", 6, "red");
	ShowVipList($prefix, $id, "Diamond", 5, "orange");
	ShowVipList($prefix, $id, "Gold", 4, "gold");
	ShowVipList($prefix, $id, "Silver", 3, "silver");
	ShowVipList($prefix, $id, "Bronze", 2, "bronze");
	ShowVipList($prefix, $id, "Iron", 1, "333333", 0);


	echo('<BR><BR><BR><BR><BR>');

}

function ShowVipList($prefix, $id, $vipName, $vip, $color, $show=1){
	$link = mysqli_connect("localhost", "hjx_asian", "tsinghuang", "hjx_db"); //vip is only in hjx_db
	$result = $link->query("SELECT count(id) FROM vip where type='" . $vip . "'");
	$res_c = $result->fetch_assoc();
	$n = $res_c['count(id)'];

	echo '<div align="center">';
	echo '<font color="' . $color . '" size="3pt">=======================<BR>' . $vipName . ' VIP ' . $n . '<BR>=======================</font><BR>';
	
	if($show ==1){
		$result = $link->query("SELECT * FROM vip where type='" . $vip . "' order by firstTime desc");
		while($row = $result->fetch_assoc()){
			$l2 = mysqli_connect("localhost", "hjx_asian", "tsinghuang", $prefix . "_db");
			$res2 = $l2->query("SELECT name FROM user where id='" . $row['id'] . "'");
			$row2 = $res2->fetch_assoc();
			echo '<font size="3pt" color="' . $color . '">' . GetProfileLink($prefix, $row2['name'], $row['id']) . " </font>";
			echo '<font size="3pt" color="20FF20">  (' . getAgo($row['firstTime']) . ")</font><BR>";
			$res2->close();
			$l2->close();
		}
	}
	
	echo '</div><BR><BR><BR><BR>';

	$result->close();
	$link->close();
}

function GetListing($prefix, $id, $type, $limit){
	//welcome
	if($type == 'Uploader.top'){
		echo '<div align="center"><font size="3pt" color="red">***************************************<BR>Hail to Top Uploaders<BR>***************************************<BR></font></div><BR>';
		echo '<font size="3pt" color="red">Rank </font>';
		echo '<font size="3pt" color="blue">Name </font>';
		echo '<font size="3pt" color="orange">Upload Score </font>';
		echo '<font size="3pt" color="20FF20"> (Last Active)</font><BR>';
		EchoHint('Upload Score = 20 * Approved - 20 * Banned + 5 * InReview + Sum(Likes) - Sum(Dislikes) - Sum(Reports) / 5');
		$query = "SELECT * FROM rank ORDER BY upload DESC";
		$field = 'upload';
		$idf = 'id';
		$useFirst = 1;
	}else if($type == 'Uploader.recent'){
		echo '<div align="center"><font size="3pt" color="red">***************************************<BR>Most Recent Uploaders<BR>***************************************<BR></font></div><BR>';
		echo '<font size="3pt" color="red">Rank </font>';
		echo '<font size="3pt" color="blue">Name </font>';
		echo '<font size="3pt" color="orange">Last Upload Time </font>';
		echo '<font size="3pt" color="20FF20"> (Last Active)</font><BR>';
		$query = "SELECT * FROM image order by uploadTime desc";
		$field = 'uploadTime';
		$idf = 'userId';
		$useFirst = 11;
	}else if($type == 'Visitor.top'){
		echo '<div align="center"><font size="3pt" color="red">***************************************<BR>Hail to Top Visitors<BR>***************************************<BR></font></div><BR>';
		echo '<font size="3pt" color="red">Rank </font>';
		echo '<font size="3pt" color="blue">Name </font>';
		echo '<font size="3pt" color="orange">Visits </font>';
		echo '<font size="3pt" color="20FF20"> (Last Active)</font><BR>';
		$query = "SELECT * FROM user ORDER BY visits DESC";
		$field = 'visits';
		$idf = 'id';
		$useFirst = 2;
	}else if($type == 'Visitor.recent'){
		echo '<div align="center"><font size="3pt" color="red">***************************************<BR>Most Recent Visitors<BR>***************************************<BR></font></div><BR>';
		echo '<font size="3pt" color="red">Rank </font>';
		echo '<font size="3pt" color="blue">Name </font>';
		echo '<font size="3pt" color="orange">Visits </font>';
		echo '<font size="3pt" color="20FF20"> (Last Active)</font><BR>';
		$query = "SELECT * FROM user ORDER BY lastTime DESC";
		$field = 'visits';
		$idf = 'id';
		$useFirst = 2;
	}else if($type == 'Rater.top'){
		echo '<div align="center"><font size="3pt" color="red">***************************************<BR>Hail to Top Raters<BR>***************************************<BR></font></div><BR>';
		echo '<font size="3pt" color="red">Rank </font>';
		echo '<font size="3pt" color="blue">Name </font>';
		echo '<font size="3pt" color="orange">Ratings </font>';
		echo '<font size="3pt" color="20FF20"> (Last Active)</font><BR>';
		$query = "SELECT * FROM rank ORDER BY rates DESC";
		$field = 'rates';
		$idf = 'id';
		$useFirst = 1;
	}else if($type == 'Rater.recent'){
		echo '<div align="center"><font size="3pt" color="red">***************************************<BR>Most Recent Raters<BR>***************************************<BR></font></div><BR>';
		echo '<font size="3pt" color="red">Rank </font>';
		echo '<font size="3pt" color="blue">Name </font>';
		echo '<font size="3pt" color="orange">Last Rate Time </font>';
		echo '<font size="3pt" color="20FF20"> (Last Active)</font><BR>';
		$query = "SELECT * FROM rate ORDER BY time DESC";
		$field = 'time';
		$idf = 'userId';
		$useFirst = 11;
	}
	ShowAd();
	echo '<BR>';
	
	
	$link = mysqli_connect("localhost", "hjx_asian", "tsinghuang", $prefix . "_db");
	
	$result = $link->query($query . ' LIMIT ' . $limit);
	$rank = 1;
	while($row = $result->fetch_assoc()){
		$l2 = mysqli_connect("localhost", "hjx_asian", "tsinghuang", $prefix . "_db");
		$res2 = $l2->query("SELECT * FROM user where id='" . $row[$idf] . "'");
		$row2 = $res2->fetch_assoc();
		echo '<font size="3pt" color="red">' . ($rank++) . " </font> ";
		echo '<font size="3pt" color="blue">' . GetProfileLink($prefix, $row2['name'], $row[$idf]) . " </font>";
		if($useFirst == 1){
			echo '<font size="3pt" color="orange"> ' . $row[$field] .  " </font>";
		}else if($useFirst == 2){
			echo '<font size="3pt" color="orange"> ' . $row2[$field] .  " </font>";
		}else if($useFirst == 11){
			echo '<font size="3pt" color="orange"> ' . getAgo($row[$field]) .  " </font>";
		}else if($useFirst == 21){
			echo '<font size="3pt" color="orange"> ' . getAgo($row2[$field]) .  " </font>";
		}
		echo '<font size="3pt" color="20FF20">  (' . getAgo($row2['lastTime']) . ")</font><BR>";
		$res2->close();
		$l2->close();
	}
	
	echo '</div><BR>';

	$result->close();
	$link->close();
}



function ShowStats($prefix, $id, $command){
	
	if($prefix == 'hjx' and $command != 'vip'){ //solve the bug for VIP showing ads
		CheckIphone();
	}

	if($command == "my"){
		//show my stats
		echo '<html><head>';
		echo '<title>User Profile</title>';
		echo '<meta name="viewport" content="width = device-width"/>
			<meta http-equiv="content-type" content="text/html; charset=utf-8">
			<meta name="apple-mobile-web-app-capable" content="yes"/>
			<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>';
		echo '</head>';
		echo '<body style="background-color:0;
		background-repeat:repeat;
		background-attachment:fixed;
		overflow:scroll;
		width:320px;
		height:100px;">';
		if(rand(0, 100) < 51){
			UpdateRank($prefix, $id);
		}
		GetProfile($prefix, $id);
		echo '<div align="center"><font size="3pt"><a href=\'#TOP\'>== Back to Top ==</a></font></div><BR>';
		echo '<div align="center"><a href="http://php.asianhots.com/join.php?prefix=' . $prefix . '"><font size="3pt">== How to Join? ==</font></a></div>';
		echo '<BR><BR><BR><BR>';
		echo '</B></body></html>';
	}elseif($command == 'topdonator'){
		//show top uploader
		echo '<html><head>';
		echo '<title>Hall of Fame (VIP)</title>';
		echo '<meta name="viewport" content="width = device-width"/>
			<meta http-equiv="content-type" content="text/html; charset=utf-8">
			<meta name="apple-mobile-web-app-capable" content="yes"/>
			<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>';
		echo '</head>';
		echo '<body style="background-color:0;
		background-repeat:repeat;
		background-attachment:fixed;
		overflow:scroll;
		width:320px;
		height:100px;">';
		GetTopDonator($prefix, $id);
		echo '<div align="center"><font size="3pt"><a href=\'#TOP\'>== Back to Top ==</a></font></div>';
		echo '<BR><BR><BR><BR><BR><BR><BR>';
		echo '</B></body></html>';
	}elseif($command == 'Uploader' || $command == 'Visitor' || $command == 'Rater'){
		//show top uploader
		//write to cache periodically and try to read cache
		echo '<html><head>';
		echo '<title>' . $command . ' Statistics</title>';
		echo '<meta name="viewport" content="width = device-width"/>
			<meta http-equiv="content-type" content="text/html; charset=utf-8">
			<meta name="apple-mobile-web-app-capable" content="yes"/>
			<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>';
		echo '</head>';
		echo '<body style="background-color:0;
		background-repeat:repeat;
		background-attachment:fixed;
		overflow:scroll;
		width:320px;
		height:100px;">';
		GetListing($prefix, $id, $command . '.recent', 20);
		GetListing($prefix, $id, $command . '.top', 100);
		ShowAd();
		echo '<div align="center"><font size="3pt"><a href=\'#TOP\'>== Back to Top ==</a></font></div>';
		echo '<BR><BR><BR><BR><BR><BR><BR>';
		echo '</B></body></html>';
	}elseif($command == 'vip'){
		echo GetVipValue($prefix, $id, $_GET['action']);
	}
}


ShowStats($_GET['prefix'], $_GET['id'], $_GET['command']);

?>

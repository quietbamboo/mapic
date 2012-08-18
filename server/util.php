<?php

function GetHttpUsr($fileName){
	$ret="http://daidaimobile.com/image/".date("Y-m-d")."/".$fileName;
}

function CheckIphone(){
	//quits if not iphone/ipod/ipad
	$iphone = strpos($_SERVER["HTTP_USER_AGENT"],"iPhone");
	$ipod = strpos($_SERVER["HTTP_USER_AGENT"],"iPod");
	$ipad = strpos($_SERVER["HTTP_USER_AGENT"],"iPad");
	if ($iphone == false and $ipod == false && $ipad == false)  { echo 'Please visit our website from an iPhone / iPod Touch / iPad<BR><BR>Visit <a href="http://php.asianhots.com/join.php?prefix=hjx">HERE</a> to join'; exit;}
}

function EchoHint($text, $ft="2.5"){
	echo '<font size="' . $ft . 'pt" color=#DDDDDD>' . $text . '<BR>';
}

function EchoSection($title, $value){
	echo '<font size="3pt" color=#B3B3FF>' . $title . '</font><BR>';
	echo '<font size="3pt" color=#FF2323>' . $value . '</font><BR>';
}

function GetProfileLink($prefix, $name, $id, $removeHref=0){
	if($removeHref == 1)
		return 'stat.php?prefix=' . $prefix . '&id=' . $id. '&command=my';
	return '<a href="stat.php?prefix=' . $prefix . '&id=' . $id. '&command=my">' . $name . '</a>';
}

function GetImageLink($prefix, $imageId){
	$baseurl = "http://" . $prefix . ".asianhots.com/thumbnail/";
	if($prefix == 'hjx')
		$baseurl = "http://iphone.dotaart.com/asian/thumbnail/";
	return '<a href="img.php?prefix=' . $prefix . '&imageId=' . $imageId. '"><img width=100 src="' . $baseurl . $imageId . '"/></a>';
}

function GetBaseUrl($prefix){
	if($prefix == 'hjx')
		return "http://iphone.dotaart.com/asian/new/";
	else
		return "http://php.asianhots.com/";
}

function AddFBComment($profileUrl){
	echo '<div style="background-color:FFFFFF;"><div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#appId=156423477748487&amp;xfbml=1"></script><fb:comments href="' . $profileUrl .  '" num_posts="10" width="320"></fb:comments></div>';
}

function AddFBLike($profileUrl){
	echo '<script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like href="' . $profileUrl .  '" show_faces="true" width="320" font="verdana" colorscheme="dark"></fb:like>';
}

function getCache($prefix, $type, $userId){
	$link = mysqli_connect("localhost", "hjx_asian", "tsinghuang", $prefix . "_db");
	
	$result = $link->query("SELECT content FROM cache where type='" . $type . "' AND userId='" . $userId . "'");
	$count = $result->num_rows;

	$row = $result->fetch_array();

	$result->close();
	$link->close();

	return $row['content'];
}

function writeCache($prefix, $type, $userId, $content){
	$link = mysqli_connect("localhost", "hjx_asian", "tsinghuang", $prefix . "_db");
	$stmt = $link->stmt_init();
	$stmt->prepare("INSERT INTO cache (type, userId, lastUpdateTime, content) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE lastUpdateTime=?, content=?");
	$currentSec = getCurrentSec();
	$stmt->bind_param('ssisis', $type, $userId, $currentSec, $content, $currentSec, $content);
	$stmt->execute();
	$stmt->close();

	$result->close();
	$link->close();
}


function getCurrentSec(){
	list($usec, $sec) = explode(" ", microtime());
	return $sec;
}


//if ago is < 0, return " later".
function getAgo($ts){
	list($usec, $sec) = explode(" ", microtime());
	$ago = (int)$sec - (int)$ts;
	if($ago >= 0)
		$append = " ago";
	else{
		$append = " later";
		$ago *= -1;
	}
	$min = (double)$ago / 60.0;
	$hour = (double)$min / 60.0;
	$day = (double)$hour / 24.0;
	$month = (double)$day / 30.0;
	$year = (double)$day / 365.0;
	
	$min = (int)((double)$min * 10.0) / 10;
	$hour = (int)((double)$hour * 10.0) / 10;
	$day = (int)((double)$day * 10.0) / 10;
	$month = (int)((double)$month * 10.0) / 10;
	$year = (int)((double)$year * 10.0) / 10;
	
	if($year >= 1){
		$time_str = "" . $year . " years";
	}elseif($month >= 1){
		$time_str = "" . $month . " months";
	}elseif($day >= 1){
		$time_str = "" . $day . " days";
	}elseif($hour >= 1){
		$time_str = "" . $hour . " hours";
	}elseif($min >= 1){
		$time_str = "" . $min . " minutes";
	}else{
		$time_str = "" . $ago . " seconds";
	}
	return $time_str . $append;
}


function delete_photo($prefix, $id, $reported_file, $vip){

	$adminId = '7117e6fd002ff4fb77d4265e828c8104437840dd';
	$adminId2 = '47229b1f20e4763df6383abf13b0d2de028988f5';

	if(strlen($id) < 10){
		return "ID less than 10 digits, not a valid device.";
	}

	list($x1, $x2, $x3) = split("___", $reported_file);
	if($x1 != $id and $id != $adminId and $id != $adminId2)
		return "You are not authorized to delete this photo";

	//insert the x1(uploader) into prison for 1 week (prison table is shared in hjx_db)
	if($id == $adminId or $id == $adminId2){
		$con = mysqli_connect("localhost","hjx_asian","tsinghuang", "hjx_db");
		mysqli_query($con, "INSERT INTO prison (id, type, firstTime) VALUES ('" . $x1  . "', '0', '" . getCurrentSec()  . "') ON DUPLICATE KEY UPDATE firstTime='" . getCurrentSec() . "'");
		mysqli_close($con);
	}
	
	$con = mysqli_connect("localhost","hjx_asian","tsinghuang", $prefix. "_db");
	
	//my iphone 4
	//delete this file completely
	mysqli_query($con, "DELETE FROM report WHERE imageId = '" . $reported_file . "'");
	mysqli_query($con, "DELETE FROM rate WHERE imageId = '" . $reported_file . "'");
	mysqli_query($con, "DELETE FROM image WHERE imageId = '" . $reported_file . "'");
	
	$path = '../' . $prefix;
	if($prefix == 'hjx')
		$path = '..';

	if(file_exists($path . '/upload_tmp/' . $reported_file))
		unlink($path . '/upload_tmp/' . $reported_file);
	if(file_exists($path . '/upload/' . $reported_file))
		unlink($path . '/upload/' . $reported_file);
	if(file_exists($path . '/thumbnail/' . $reported_file))
		unlink($path . '/thumbnail/' . $reported_file);
	if(file_exists($path . '/duplicate/' . $reported_file))
		unlink($path . '/duplicate/' . $reported_file);
	if(file_exists($path . '/rubbish/' . $reported_file))
		unlink($path . '/rubbish/' . $reported_file);
	
	mysqli_close($con);
	return "Permanently deleted photo (id:" . $reported_file . ")";
}

//used by upload
function GetPrisonValue($prefix, $id, $action){
	//determine whether for an action this user is in prison
	$link = mysqli_connect("localhost", "hjx_asian", "tsinghuang", "hjx_db"); //prison table only in hjx_db
	
	$du = 7 * 24 * 3600;
	$result = $link->query("SELECT count(id) FROM prison WHERE id='" . $id . "' AND firstTime > '" . (getCurrentSec()-$du) . "'");
	$res_c = $result->fetch_assoc();
	$n = $res_c['count(id)'];

	if($n > 0){
		$result = $link->query("SELECT * FROM prison where id='" . $id . "'");
		$res_c = $result->fetch_assoc();
		//release date
		$res = getAgo($res_c['firstTime'] + $du);
	}else{
		$res = "NO";
	}

	$result->close();
	$link->close();
	return $res;
}

//used by stat (vip.ads), rate, report
function GetVipValue($prefix, $id, $action){
	//determine whether for an action this user is VIP

	$link = mysqli_connect("localhost", "hjx_asian", "tsinghuang", "hjx_db"); //vip table only in hjx_db
	
	$result = $link->query("SELECT * FROM vip where id='" . $id . "'");
	$res_c = $result->fetch_assoc();
	$type = $res_c['type'];
	$du = 0;
	
	if($action == "ads"){
		if($type == 1){//'iron'){
			$du = 24 * 3600;
		}else if($type == 2){//'bronze'){
			$du = 7 * 24 * 3600;
		}else if($type == 3){//'silver'){
			$du = 30 * 24 * 3600;
		}else if($type == 4){//'gold'){
			$du = 365 * 24 * 3600;
		}else if($type == 5){//'diamond'){
			//$du = 1825 * 24 * 3600;
			//temporarily set to be 1 year to solve the bug
			$du = 365 * 24 * 3600;
		}else if($type == 6){//'super'){
			//$du = 9999 * 24 * 3600;
			$du = 365 * 24 * 3600;
		}else{
			//should be impossible to reach here
			$du = 365 * 24 * 3600;
		}
		$result = $link->query("SELECT count(id) FROM vip WHERE id='" . $id . "' AND firstTime > '" . (getCurrentSec()-$du) . "'");
		$res_c = $result->fetch_assoc();
		$n = $res_c['count(id)'];
		$res = $n; //elligible 1, otherwise 0

	}else if($action == "rate" || $action == "report"){
		$vote = 1;
		if($type == 1){//'iron'){
			$du = 7 * 24 * 3600;
			$vote = 2;
		}else if($type == 2){//'bronze'){
			$du = 30 * 24 * 3600;
			$vote = 3;
		}else if($type == 3){//'silver'){
			$du = 90 * 24 * 3600;
			$vote = 4;
		}else if($type == 4){//'gold'){
			$du = 1000 * 24 * 3600;
			$vote = 8;
		}else if($type == 5){//'diamond'){
			$du = 9999 * 24 * 3600;
			$vote = 16;
		}else if($type == 6){//'super'){
			$du = 9999 * 24 * 3600;
			$vote = 32;
		}else{
			//should be impossible to reach here
		}
		$result = $link->query("SELECT count(id) FROM vip WHERE id='" . $id . "' AND firstTime > '" . (getCurrentSec()-$du) . "'");
		$res_c = $result->fetch_assoc();
		$n = $res_c['count(id)'];
		if($n == 0)
			$vote = 1;
		$res = $vote;
	}

	$result->close();
	$link->close();
	return $res;
}

function ShowAd(){
	echo '<div align = "center"><script type="text/javascript">
		var admob_vars = {
			 pubid: \'a14b3533148798b\', // publisher id
				  bgcolor: \'000000\', // background color (hex)
				   text: \'4C586A\', // font-color (hex)
				    ama: false, // set to true and retain comma for the AdMob Adaptive Ad Unit, a special ad type designed for PC sites accessed from the iPhone.  More info: http://developer.admob.com/wiki/IPhone#Web_Integration
				     test: false // test mode, set to false to receive live ads
};
</script>
<script type="text/javascript" src="http://mmv.admob.com/static/iphone/iadmob.js"></script></div>';
}

function ShowAdOld(){
	/*echo '<div align = "center"><script type="text/javascript">
		var admob_vars = {
			 pubid: \'a14b3533148798b\', // publisher id
				  bgcolor: \'000000\', // background color (hex)
				   text: \'4C586A\', // font-color (hex)
				    ama: false, // set to true and retain comma for the AdMob Adaptive Ad Unit, a special ad type designed for PC sites accessed from the iPhone.  More info: http://developer.admob.com/wiki/IPhone#Web_Integration
				     test: false // test mode, set to false to receive live ads
};
</script>
<script type="text/javascript" src="http://mmv.admob.com/static/iphone/iadmob.js"></script></div>';
	 //*/

// AdMob Publisher Code
// Language: PHP (curl)
// Version: 20081105
// Copyright AdMob, Inc., All rights reserved
// Documentation at http://developer.admob.com/wiki/Main_Page

$admob_params = array(
		'PUBLISHER_ID'      => 'a14d6f371610dd6', // Required to request ads. To find your Publisher ID, log in to your AdMob account and click on the "Sites & Apps" tab.
		'ANALYTICS_ID'      => 'your_analytics_site_id', // Required to collect Analytics data. To find your Analytics ID, log in to your Analytics account and click on the "Edit" link next to the name of your site.
		'AD_REQUEST'        => true, // To request an ad, set to TRUE.
		'ANALYTICS_REQUEST' => false, // To enable the collection of analytics data, set to TRUE.
		'TEST_MODE'         => false, // While testing, set to TRUE. When you are ready to make live requests, set to FALSE.
		// Additional optional parameters are available at: http://developer.admob.com/wiki/AdCodeDocumentation
		'OPTIONAL'          => array()
		);

// Optional parameters for AdMob Analytics (http://analytics.admob.com)
//$admob_params['OPTIONAL']['title'] = "Enter Page Title Here"; // Analytics allows you to track site usage based on custom page titles. Enter custom title in this parameter.
//$admob_params['OPTIONAL']['event'] = "Enter Event Name Here"; // To learn more about events, log in to your Analytics account and visit this page: http://analytics.admob.com/reports/events/add

/* This code supports the ability for your website to set a cookie on behalf of AdMob
 * To set an AdMob cookie, simply call admob_setcookie() on any page that you call admob_request()
 * The call to admob_setcookie() must occur before any output has been written to the page (http://www.php.net/setcookie)
 * If your mobile site uses multiple subdomains (e.g. "a.example.com" and "b.example.com"), then pass the root domain of your mobile site (e.g. "example.com") as a parameter to admob_setcookie().
 * This will allow the AdMob cookie to be visible across subdomains
 */
//admob_setcookie();

/* AdMob strongly recommends using cookies as it allows us to better uniquely identify users on your website.
 * This benefits your mobile site by providing:
 *    - Improved ad targeting = higher click through rates = more revenue!
 *    - More accurate analytics data (http://analytics.admob.com)
 */

// Send request to AdMob. To make additional ad requests per page, copy and paste this function call elsewhere on your page.
echo admob_request($admob_params);
echo '<BR>';
}

// This section defines AdMob functions and should be used AS IS.
// We recommend placing the following code in a separate file that is included where needed.

function admob_request($admob_params) {
	static $pixel_sent = false;

	$ad_mode = false;
	if (!empty($admob_params['AD_REQUEST']) && !empty($admob_params['PUBLISHER_ID'])) $ad_mode = true;

	$analytics_mode = false;
	if (!empty($admob_params['ANALYTICS_REQUEST']) && !empty($admob_params['ANALYTICS_ID']) && !$pixel_sent) $analytics_mode = true;

	$protocol = 'http';
	if (!empty($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) != 'off') $protocol = 'https';

	$rt = $ad_mode ? ($analytics_mode ? 2 : 0) : ($analytics_mode ? 1 : -1);
	if ($rt == -1) return '';

	list($usec, $sec) = explode(' ', microtime()); 
	$params = array('rt=' . $rt,
			'z=' . ($sec + $usec),
			'u=' . urlencode($_SERVER['HTTP_USER_AGENT']), 
			'i=' . urlencode($_SERVER['REMOTE_ADDR']), 
			'p=' . urlencode("$protocol://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']),
			'v=' . urlencode('20081105-PHPCURL-acda0040bcdea222')); 

	$sid = empty($admob_params['SID']) ? session_id() : $admob_params['SID'];
	if (!empty($sid)) $params[] = 't=' . md5($sid);
	if ($ad_mode) $params[] = 's=' . $admob_params['PUBLISHER_ID'];
	if ($analytics_mode) $params[] = 'a=' . $admob_params['ANALYTICS_ID'];
	if (!empty($_COOKIE['admobuu'])) $params[] = 'o=' . $_COOKIE['admobuu'];
	if (!empty($admob_params['TEST_MODE'])) $params[] = 'm=test';

	if (!empty($admob_params['OPTIONAL'])) {
		foreach ($admob_params['OPTIONAL'] as $k => $v) {
			$params[] = urlencode($k) . '=' . urlencode($v);
		}
	}

	$ignore = array('HTTP_PRAGMA' => true, 'HTTP_CACHE_CONTROL' => true, 'HTTP_CONNECTION' => true, 'HTTP_USER_AGENT' => true, 'HTTP_COOKIE' => true);
	foreach ($_SERVER as $k => $v) {
		if (substr($k, 0, 4) == 'HTTP' && empty($ignore[$k]) && isset($v)) {
			$params[] = urlencode('h[' . $k . ']') . '=' . urlencode($v);
		}
	}

	$post = implode('&', $params);
	$request = curl_init();
	$request_timeout = 1; // 1 second timeout
	curl_setopt($request, CURLOPT_URL, 'http://r.admob.com/ad_source.php');
	curl_setopt($request, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($request, CURLOPT_TIMEOUT, $request_timeout);
	curl_setopt($request, CURLOPT_CONNECTTIMEOUT, $request_timeout);
	curl_setopt($request, CURLOPT_HTTPHEADER, array('Content-Type: application/x-www-form-urlencoded', 'Connection: Close'));
	curl_setopt($request, CURLOPT_POSTFIELDS, $post);
	list($usec_start, $sec_start) = explode(' ', microtime());
	$contents = curl_exec($request);
	list($usec_end, $sec_end) = explode(' ', microtime());
	curl_close($request);

	if ($contents === true || $contents === false) $contents = '';

	if (!$pixel_sent) {
		$pixel_sent = true;
		$contents .= "<img src=\"$protocol://p.admob.com/e0?"
			. 'rt=' . $rt
			. '&amp;z=' . ($sec + $usec)
			. '&amp;a=' . ($analytics_mode ? $admob_params['ANALYTICS_ID'] : '')
			. '&amp;s=' . ($ad_mode ? $admob_params['PUBLISHER_ID'] : '')
			. '&amp;o=' . (empty($_COOKIE['admobuu']) ? '' : $_COOKIE['admobuu'])
			. '&amp;lt=' . ($sec_end + $usec_end - $sec_start - $usec_start)
			. '&amp;to=' . $request_timeout
			. '" alt="" width="1" height="1"/>';
	}

	return $contents;
}

function admob_setcookie($domain = '', $path = '/') {
	if (empty($_COOKIE['admobuu'])) {    
		$value = md5(uniqid(rand(), true));
		if (!empty($domain) && $domain[0] != '.') $domain = ".$domain";
		if (setcookie('admobuu', $value, mktime(0, 0, 0, 1, 1, 2038), $path, $domain)) {
			$_COOKIE['admobuu'] = $value; // make it visible to admob_request()
		} 
	}
}

function AddThis(){
	echo '<div align="center"><div class="addthis_toolbox addthis_default_style addthis_32x32_style">
		<a class="addthis_button_facebook"></a>
		<a class="addthis_button_twitter"></a>
		<a class="addthis_button_email"></a>
		<a class="addthis_button_tweet"></a>
		<a class="addthis_button_compact"></a>
		</div>
		<script type="text/javascript">var addthis_config = {"data_track_clickback":true};</script>
		<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4d6f3ef2185a5a36"></script>
		</div>';
}


?>

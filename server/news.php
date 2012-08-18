<?php

include_once 'util.php';

function registerUser($prefix, $id, $name, $vip){

	$con = mysqli_connect("localhost","hjx_asian","tsinghuang", $prefix . "_db");
	mysqli_query($con, "INSERT INTO user (id, name, firstTime, lastTime, vip) VALUES ('" . $id . "', '" . $name . "', '" . getCurrentSec() . "', '" . getCurrentSec() . "', '" . $vip . "') ON DUPLICATE KEY UPDATE name='" . $name . "', lastTime='" . getCurrentSec() . "', vip='" . $vip . "', visits=visits+1");
	mysqli_close($con);
}

function getNews($prefix){
	$news = "";
	if($prefix == 'show1'){
		$news .= "Help us!\nNew images are coming every second!\n\nClick \"Read more\" to review the new images\n\nYou can directly go to the following URL:\nhttp://show.asianhots.com/php/review.php";
		$news .= "_____";
		$news .= "http://show.asianhots.com/php/review.php";
	}else if($prefix == 'pet1'){
		$news .= "Welcome to Cute Pets 4.0\nWant to see what are the new changes and improvements in this version?";
		$news .= "_____";
		$news .= "http://itunes.apple.com/us/app/cute-pet/id357338683?mt=8";
	}else if($prefix == 'background1'){
		$news .= "Welcome to Backgrounds Share\nWant to see what are the new changes and improvements in this version?";
		$news .= "_____";
		$news .= "http://itunes.apple.com/us/app/backgrounds-share/id358801411?mt=8";
	}else if($prefix == 'baby1'){
		$news .= "Welcome to Cute Baby\nWant to see what are the new changes and improvements in this version?";
		$news .= "_____";
		$news .= "http://itunes.apple.com/us/app/cute-baby/id358811011?mt=8";
	//}else if($prefix == 'hjx'){
		//for all apps!!!
	}else{
		//$news .= "Free VIP offer!! Currently limited to 10 first users who reply. Seize the chance!!\nWe need help from some warm-hearted Asian Hots fans. Here is the deal: our server provider warns to ban AH because of sexual contents, so I'm asking help from you guys to help me (there are way too many photos for me to check one by one) get rid of the naked girls' photos(Bikini is fine, but photos without bra showing the breast is not allowed). If you helped us get rid of 500 naked photos, we give you a silver VIP for free!!\n\nHow to join? Send emails to asianhots@gmail.com with your device ID in the \"My Statistics\" section saying you are willing to join\n\nThen we will send you an email on how to report naked photos to be removed. You just need to browse through pictures and click the <!> button to report any photo with sexual/naked contents. And we will check whether your reports are actually valid.\n\nWelcome to Asian Hots\n\nHelp us review Asian Beauty Art now";
		//$news .= "Thank you guys, we have many many volunteers! Thank you for you support. Someone wrote to me asking me to stop removing naked photos. I appreciated his support, but I also want to clarify that hot does not necessarily mean naked. We can have many beautiful and hot chicks without causing unnecessary trouble :D\n\nAnyways, thank you guys for your passion and support!";
		//$news .= "Welcome to Asian Hots Pro\n\nFor business collaboration and advertisement service, contact me at asianhots@gmail.com\n\nWith more than 1 million advertisement views daily (most users are male), our small app can help your business grow larger\n\nThe price of advertising with us is negotiable since I'm just starting to seek direct collaboration with other parties.\n\nAs always, have a good time here:)";
		//$news .= "Dear Asian Hots Fans:\nWe are pleased to officially announce a Youtube Challenge starting from 05/20/2011 to 8/20/2011.\n\nHOW TO ENTERE YOUTUBE CHALLENGE?\n\nMake a video of ANY LENGTH and post to Youtube\n*******************************************\nRELATED with our Asian Hots iPhone app and include our link http://asianhots.com into your video's description\n*******************************************\nThe video should be creative and funny. How? Refer to Youtubers nigahiga RWJ MGM SMOSH for examples. It could be a theme song (maybe rap?) you write and sing for this app, or a simple animation showing how crazy you are when browsing these hot Asian chicks:P\n\nBy the end of this challenge, based on the number of views of your Youtube video, you will get one of the following prizes:\n\nPRIZE CRITERIA:\n\n100~1000 views: Iron VIP\n1000~5000 views: Bronze VIP\n5,000~50,000 views: Silver VIP\n50,000~200,000 views: Golden VIP\n200,000~500,000 views: Diamond VIP\n500,000~1,000,000 views: Free Super VIP + USD $20 Cash\n>1,000,000 views: Super VIP + USD $50 Cash\n\nSend us email (asianhots@gmail.com) when you have your video ready and we will INCLUDE YOUR VIDEOS IN OUR FUTURE UPDATES OF ASIAN HOTS";
		//$news .= "We found a very cool mobile application. Click \"Read More\" to go to the link and on the right of the page, please vote with your facebook account or by registering a new account";
		//$news .= "We are hiring part-time Software Developers!\n\nIf you are interested in contributing to future versions of AHs, please let us know, we will pay you $100 - $2000 per small task depending on how much work is involved and how many more new users are attracted.\n\nPlease do not hesitate on sending us emails asianhots@gmail.com to discuss the details!\n\nWe need excellent developers!!";
		//$news .= "Finally, we have iPad support in version 4.3.9+ !\n\nTry to install AHP in your iPad from installous or our website http://apt.dotaart.com and hope you will enjoy even more!";
		$news .= "Talk to the chat robot DaiDai now! He can speak in 49 languages with a very cute voice, he will definitely make you LOL. Plus he is free to use!";
		$news .= "_____";
		#$news .= "http://www.6park.com/cgi-bin/ain.pl?id=667&ban=bj";
		//$news .= "http://iphone.asianhots.com/php/review.php";
		$news .= "http://itunes.apple.com/us/app/daidai/id484833168";
		//$news .= "http://challenge.gov/challenges/114/submissions/3134-mobiperf-mobile-network-measurement-system";
	}

	//$news = "God bless Japan! Donate to Japan Earthquake and Pacific Tsunami\n\nPlease donate some money to American Red Cross\n\nGod bless you! God bless everyone!!\n\nClick \"Read more\" to go to American Redcross's official page";
	//$news .= "_____";
	//$news .= "https://american.redcross.org/site/Donation2?idb=0&5052.donation=form1&df_id=5052";

	return $news;
}


$id = $_POST['id'];
$username = $_POST['username'];
$p = $_POST['prefix'];


if(strlen($id) > 10){
	$vip = 0;
	if($p == 'hjx'){
		$vip = 8;
	}

	registerUser($p, $id, $username, $vip);
	echo getNews($p);
}

?>

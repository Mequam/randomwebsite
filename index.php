<!DOCTYPE html>
<html>
	<head>	
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="style/main.css">
		<title>Sound Mess</title>
	</head>
	<body ng-app="vidDisp" 
		ng-init="<?php
			$conn = pg_connect("dbname=myTube");
			$result = pg_query_params($conn,"SELECT vid_source,vid_thumb,vid_title FROM videosInPlayList($1);",ARRAY($_GET["PLAY_LIST_ID"]));//TODO: we could use the playlist name here, better for users
			echo 'lstVid = [';
			while ($row = pg_fetch_row($result)) {
				echo '{src:\''.$row[0].'\',thumbnail:\''.$row[1].'\',title:\''.$row[2].'\'},';
			}
			echo ']';
			pg_close($conn)
			
			//'lstVid=[{type:mp4,thumbnail:"videos/soundMess/week1/thumbnail.png",src:"videos/soundMess/week1/week1.mp4",title:"Silo Boss"},
			//{type:mp4,thumbnail:"videos/soundMess/week2/thumbnail.png",src:"videos/soundMess/week2/week2.mp4",title:"Migrains and Sadness"}]'
	?>"
		class="container">
		<div>
			<div class="page-header">
				<h1>Sound Mess</h1>
			</div>
			<div class="row" ng-controller="lstCntrl">
				
				<div class="col-md-1">
				</div>
				<!--space hack using bootstrap 3 columns--!>
				<div class="col-md-8 text-center">
					<ng-include src="'vidDisp.html'"></ng-include>
				</div>
				
				<!--space hack using bootstrap 3 columns--!>
				<div class=col-md-3>
					<ng-include src="'videoSelector.html'"></ng-include>
				</div>

			</div>
		</div>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>	
	<script src="js/videos.js"></script>
	</body>
</html>

//$(document).ready(()=>{console.log("ready!")});
var vidApp = angular.module("vidDisp",[]);
vidApp.controller("lstCntrl",function ($scope) {		
	$scope.targetIdx = 0;
	$scope.setIdx = (val) => {
		$scope.targetIdx = val;	
	};
	$scope.getTitle = (idx,title)=>{
		return "Weekly Update " + idx + " - " + title;
	}
});

/* IRIS DATA SEARCH 
   http://iris.lmsal.com/search/
   支持jQuery
   通过目的来查找数据（如 AR Tracking）
   在网页的“审查元素->控制台”功能下执行
*/

// class中带空格不是指一个class，而是指两种class中的任意一种。
// $("input.gwt-DateBox.iristodayDateBoxSize");

function O(cls) {
	return document.getElementsByClassName(cls);
}

function setTime(time, stTime, edTime) {
	time[0].value = stTime;
	time[1].value = edTime;
}

var time = O("gwt-DateBox iristodayDateBoxSize");

// 设置时间
timeID = 1

//Desc: AR Tracking 
switch (timeID) {
	case 1:	
		setTime(time, "2015-01-22T00:00", "2015-02-04T00:00"); break;
	case 2:
		setTime(time, "2014-12-09T00:00", "2014-12-18T00:00"); break;
	case 3:
		setTime(time, "2015-02-21T00:00", "2015-03-02T00:00"); break;
	case 4:
		setTime(time, "2015-03-10T00:00", "2015-04-04T00:00"); break;
	case 5:
		setTime(time, "2015-04-05T00:00", "2015-04-15T00:00"); break;
	case 6:
		setTime(time, "2015-04-16T00:00", "2015-04-27T00:00"); break;
	case 7:
		setTime(time, "2015-05-28T00:00", "2015-06-08T00:00"); break;
	case 8:
		setTime(time, "2015-07-14T00:00", "2015-07-27T00:00"); break;
	case 9:
		setTime(time, "2015-08-04T00:00", "2015-08-14T00:00"); break;
	case 10:
		setTime(time, "2015-08-25T00:00", "2015-09-07T00:00"); break;
	case 11:
		setTime(time, "2015-11-13T00:00", "2015-11-25T00:00"); break;
	case 12:
		setTime(time, "2015-11-26T00:00", "2015-12-07T00:00"); break;
	case 13:
		setTime(time, "2015-12-08T00:00", "2015-12-18T00:00"); break;
	case 14:
		setTime(time, "2014-11-17T00:00", "2014-11-27T00:00"); break;
}

// 搜索特定数据
$("input.gwt-TextBox.tightTextBox").value = "AR Tracking";
$("button.gwt-Button.irisSearchButton").click();

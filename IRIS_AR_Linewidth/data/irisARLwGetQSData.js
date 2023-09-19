/* IRIS DATA SEARCH 
   http://iris.lmsal.com/search/
   支持jQuery
   通过目的来查找数据
   在网页的“审查元素->控制台”功能下执行
*/

function O(cls) {
	return document.getElementsByClassName(cls);
}

function setTime(time, stTime, edTime) {
	time[0].value = stTime;
	time[1].value = edTime;
}

var evtID = 34;

// Get time tag
var time = O("gwt-DateBox iristodayDateBoxSize");

// 设置时间
switch (evtID) {
	case 33:	
		setTime(time, "2014-07-01T00:00", "2014-07-11T00:00"); break;
	case 34:
		setTime(time, "2014-07-13T00:00", "2014-07-25T00:00"); break;
	case 35:
		setTime(time, "2014-07-27T00:00", "2017-07-06T00:00"); break;
}

$("input.gwt-TextBox.tightTextBox").value = "QS tracking from limb to limb"; 

// 手动设置谱线
// $("button.gwt-Button.irisSearchButtonBig").click();

$("button.gwt-Button.irisSearchButton").click();

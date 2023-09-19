/* IRIS DATA SEARCH 
   http://iris.lmsal.com/search/
   支持jQuery
   通过目的来查找数据
   在网页的“审查元素->控制台”功能下执行
*/

// class中带空格不是指一个class，而是指两种class中的任意一种。
// $("input.gwt-DateBox.iristodayDateBoxSize"); // 选择多个class

function O(cls) {
	return document.getElementsByClassName(cls);
}

function setTime(time, stTime, edTime) {
	time[0].value = stTime;
	time[1].value = edTime;
}

var time = O("gwt-DateBox iristodayDateBoxSize");

var evtID = 23

// 设置步长上限
if (evtID != 33) {
	// Raster Step - Count - minimum 
	O("gwt-TextBox irisSearchStdFont")[8].value = "200";
	// Raster Step - Size - minimum 
	O("gwt-TextBox irisSearchStdFont")[10].value = "0.01"; // Set this value to avoid sit and stare
	// Raster Step - Size - maximum
	O("gwt-TextBox irisSearchStdFont")[11].value = "0.5";
}


// 设置时间
if (evtID >= 15 && evtID <= 17) {
	// Period 1
	setTime(time, "2014-01-01T00:00", "2014-12-31T59:59");
} else if (evtID >= 18 && evtID <= 19) {
	// Period 2
	setTime(time, "2015-01-01T00:00", "2015-06-31T59:59");
} else if (evtID >= 20 && evtID <= 31) {
	// Period 3
	setTime(time, "2015-06-01T00:00", "2016-02-20T59:59");
} else if (evtID == 32) {
	// Period 4
	setTime(time, "2016-01-01T00:00", "2016-03-31T59:59");
} else {
	// QS
	setTime(time, "2014-06-01T00:00", "2014-08-31T59:59");
}

// High time resolution data
switch (evtID) {
/* Period 1 */
case 15:	
	$("input.gwt-TextBox.tightTextBox").value = "12104"; break;
case 16:
	$("input.gwt-TextBox.tightTextBox").value = "11944"; break;
case 17:
	$("input.gwt-TextBox.tightTextBox").value = "12139"; break;
/* Period 2 */
case 18:
	$("input.gwt-TextBox.tightTextBox").value = "12282"; break;
case 19:
	$("input.gwt-TextBox.tightTextBox").value = "12289"; break;
/* Period 3 */
case 20:
	$("input.gwt-TextBox.tightTextBox").value = "12420"; break;
case 21:
	$("input.gwt-TextBox.tightTextBox").value = "12449"; break;
case 22:
	$("input.gwt-TextBox.tightTextBox").value = "12454"; break;
case 23:
	$("input.gwt-TextBox.tightTextBox").value = "12458"; break;
case 24:
	$("input.gwt-TextBox.tightTextBox").value = "Evolution of Unnamed AR near CH"; break;
case 25:
	$("input.gwt-TextBox.tightTextBox").value = "12470"; break;
case 26:
	$("input.gwt-TextBox.tightTextBox").value = "12473"; break;
case 27:
	$("input.gwt-TextBox.tightTextBox").value = "12480"; break;
case 28:
	$("input.gwt-TextBox.tightTextBox").value = "12485"; break;
case 29:
	$("input.gwt-TextBox.tightTextBox").value = "12487"; break;
case 30:
	$("input.gwt-TextBox.tightTextBox").value = "12489"; break;
case 31:
	$("input.gwt-TextBox.tightTextBox").value = "12494"; break;
/* Period 4 */
case 32:
	$("input.gwt-TextBox.tightTextBox").value = "12506"; break;
/* QS */
case 33:
	$("input.gwt-TextBox.tightTextBox").value = "QS tracking from limb to limb"; break;
}

// 搜索特定数据
$("button.gwt-Button.irisSearchButton").click();
/* IRIS DATA SEARCH 
   http://iris.lmsal.com/search/
   ֧��jQuery
   ͨ��Ŀ�����������ݣ��� AR Tracking��
   ����ҳ�ġ����Ԫ��->����̨��������ִ��
*/

// class�д��ո���ָһ��class������ָ����class�е�����һ�֡�
// $("input.gwt-DateBox.iristodayDateBoxSize");

function O(cls) {
	return document.getElementsByClassName(cls);
}

function setTime(time, stTime, edTime) {
	time[0].value = stTime;
	time[1].value = edTime;
}

var time = O("gwt-DateBox iristodayDateBoxSize");

// ����ʱ��
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

// �����ض�����
$("input.gwt-TextBox.tightTextBox").value = "AR Tracking";
$("button.gwt-Button.irisSearchButton").click();

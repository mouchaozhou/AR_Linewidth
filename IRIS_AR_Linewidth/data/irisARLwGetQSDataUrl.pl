use LWP::Simple qw( get );
use Win32;
use feature ":5.10";

# ==============================================================================================

sub writeURLs { my ($message, $filename, @url) = @_;
	# 弹出一个对话框确认文件个数是否与数据个数一致，一致则写入将数据URL写入文件
	if (Win32::MsgBox($message, 4, "check") == 6) {
		# 写入 url
		open FURL, ">", $filename;
		printf FURL "$_\n" foreach (@url);
		close FURL;
	}
}
# ==============================================================================================


# main

# 事件编号
my $evtNum = 35;  # 33 - 35

# 读取页面
if ($evtNum == 33) {
	$_ = get('http://www.lmsal.com/hek/hcr?cmd=search-events3&outputformat=json&startTime=2014-07-01T00:00&stopTime=2014-07-11T00:00&specWindows=Si+IV+1394,Si+IV+1403&hasData=true&obsDesc=QS+tracking+from+limb+to+limb');
} elsif ($evtNum == 34) {
	$_ = get('http://www.lmsal.com/hek/hcr?cmd=search-events3&outputformat=json&startTime=2014-07-13T00:00&stopTime=2014-07-25T00:00&specWindows=Si+IV+1394,Si+IV+1403&hasData=true&obsDesc=QS+tracking+from+limb+to+limb');
} elsif ($evtNum == 35) {
	$_ = get('http://www.lmsal.com/hek/hcr?cmd=search-events3&outputformat=json&startTime=2014-07-27T00:00&stopTime=2017-07-06T00:00&specWindows=Si+IV+1394,Si+IV+1403&hasData=true&obsDesc=QS+tracking+from+limb+to+limb');
}

# 匹配数据文件(Spectrum)链接
my @spUrl = $_ =~ /http:\/\/www\.lmsal\.com\/solarsoft\/irisa\/data\/level2_compressed\/.{73}raster\.tar\.gz/ig;
# 写入sp url
writeURLs("The found sp data number is ".scalar(@spUrl)."\n", "sp.txt", @spUrl);
use LWP::Simple qw( get );
use Win32;
use feature ":5.10";

# ==============================================================================================

sub writeURLs { my ($message, $filename, @url) = @_;
	# ����һ���Ի���ȷ���ļ������Ƿ������ݸ���һ�£�һ����д�뽫����URLд���ļ�
	if (Win32::MsgBox($message, 4, "check") == 6) {
		# д�� url
		open FURL, ">", $filename;
		printf FURL "$_\n" foreach (@url);
		close FURL;
	}
}
# ==============================================================================================


# main

# �¼����
my $evtNum = 35;  # 33 - 35

# ��ȡҳ��
if ($evtNum == 33) {
	$_ = get('http://www.lmsal.com/hek/hcr?cmd=search-events3&outputformat=json&startTime=2014-07-01T00:00&stopTime=2014-07-11T00:00&specWindows=Si+IV+1394,Si+IV+1403&hasData=true&obsDesc=QS+tracking+from+limb+to+limb');
} elsif ($evtNum == 34) {
	$_ = get('http://www.lmsal.com/hek/hcr?cmd=search-events3&outputformat=json&startTime=2014-07-13T00:00&stopTime=2014-07-25T00:00&specWindows=Si+IV+1394,Si+IV+1403&hasData=true&obsDesc=QS+tracking+from+limb+to+limb');
} elsif ($evtNum == 35) {
	$_ = get('http://www.lmsal.com/hek/hcr?cmd=search-events3&outputformat=json&startTime=2014-07-27T00:00&stopTime=2017-07-06T00:00&specWindows=Si+IV+1394,Si+IV+1403&hasData=true&obsDesc=QS+tracking+from+limb+to+limb');
}

# ƥ�������ļ�(Spectrum)����
my @spUrl = $_ =~ /http:\/\/www\.lmsal\.com\/solarsoft\/irisa\/data\/level2_compressed\/.{73}raster\.tar\.gz/ig;
# д��sp url
writeURLs("The found sp data number is ".scalar(@spUrl)."\n", "sp.txt", @spUrl);
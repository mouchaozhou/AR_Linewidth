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

sub getPageURL { my ($evtNum) = @_;
	my $startTime;
	my $stopTime;
	my $obsDesc;

	# �õ��¼���ʼ����ʱ��
	given ($evtNum) {
		# AR Tracking 
		when (1)  { $startTime = "2015-01-22T00:00"; $stopTime = "2015-02-04T00:00"; }
		when (2)  { $startTime = "2014-12-09T00:00"; $stopTime = "2014-12-18T00:00"; }
		when (3)  { $startTime = "2015-02-21T00:00"; $stopTime = "2015-03-02T00:00"; }
		when (4)  { $startTime = "2015-03-10T00:00"; $stopTime = "2015-04-04T00:00"; }
		when (5)  { $startTime = "2015-04-05T00:00"; $stopTime = "2015-04-15T00:00"; }
		when (6)  { $startTime = "2015-04-16T00:00"; $stopTime = "2015-04-27T00:00"; }
		when (7)  { $startTime = "2015-05-28T00:00"; $stopTime = "2015-06-08T00:00"; }
		when (8)  { $startTime = "2015-07-14T00:00"; $stopTime = "2015-07-27T00:00"; }
		when (9)  { $startTime = "2015-08-04T00:00"; $stopTime = "2015-08-14T00:00"; }
		when (10) { $startTime = "2015-08-25T00:00"; $stopTime = "2015-09-07T00:00"; }
		when (11) { $startTime = "2015-11-13T00:00"; $stopTime = "2015-11-25T00:00"; }
		when (12) { $startTime = "2015-11-26T00:00"; $stopTime = "2015-12-07T00:00"; }
		when (13) { $startTime = "2015-12-08T00:00"; $stopTime = "2015-12-18T00:00"; }	
		when (14) { $startTime = "2014-11-17T00:00"; $stopTime = "2014-11-27T00:00"; }
		# High resolution
		# Period 1
		when (15) { $obsDesc = "12104"; } # 1
		when (16) { $obsDesc = "11944"; } # 2
		when (17) { $obsDesc = "12139"; } # 3
		# Period 2
		when (18) { $obsDesc = "12282"; } # 4
		when (19) { $obsDesc = "12289"; } # 5
		# Period 3
		when (20) { $obsDesc = "12420"; } # 6
		when (21) { $obsDesc = "12449"; } # 7
		when (22) { $obsDesc = "12454"; } # 8
		when (23) { $obsDesc = "12458"; } # 9
		when (24) { $obsDesc = "Evolution of Unnamed AR near CH"; } # 10
		when (25) { $obsDesc = "12470"; } # 11
		when (26) { $obsDesc = "12473"; } # 12
		when (27) { $obsDesc = "12480"; } # 13
		when (28) { $obsDesc = "12485"; } # 14
		when (29) { $obsDesc = "12487"; } # 15
		when (30) { $obsDesc = "12489"; } # 16
		when (31) { $obsDesc = "12494"; } # 17
		# Period 4
		when (32) { $obsDesc = "12506"; } # 18
		# QS (obsolete)
		when (33) { $obsDesc = "QS tracking from limb to limb"; } 
	}
	
	# High resolution data time 
	if ($evtNum >= 15 && $evtNum <= 17) {
		# Period 1
		$startTime = "2014-01-01T00:00";
		$stopTime  = "2015-01-02T11:59";
	} elsif ($evtNum >= 18 && $evtNum <= 19) {
		# Period 2
		$startTime = "2015-01-01T00:00";
		$stopTime  = "2015-07-03T11:59";
	} elsif ($evtNum >= 20 && $evtNum <= 31) {
		# Period 3
		$startTime = "2015-06-01T00:00";
		$stopTime  = "2016-02-22T11:59";
	} elsif ($evtNum ==32) {
		# Period 4
		$startTime = "2016-01-01T00:00";
		$stopTime  = "2016-04-02T11:59";
	} elsif ($evtNum == 33) {
		# QS
		$startTime = "2014-06-01T00:00";
		$stopTime  = "2014-08-31T59:59";
	}
	
	# URL ǰ׺
	my $prefixStr = 'https://www.lmsal.com/hek/hcr?cmd=search-events3&outputformat=json&startTime=';
    
	# URL ��׺
	my $postfixStr;
	if ($evtNum >= 1 && $evtNum <= 14) {
		$postfixStr = '&hasData=true&obsDesc=AR+Tracking';
	} else if ($evtNum >= 15 && $evtNum <= 32) {
		$postfixStr = '&minrasterStepsize=0.01&maxrasterStepsize=0.5&minnumRasterSteps=200&hasData=true&obsDesc='.$obsDesc;
	} else {
		$postfixStr = '&hasData=true&obsDesc='.$obsDesc;
	}
	
	# ����Data URL ���ڵ�ҳ��URL
	return $prefixStr.$startTime.'&stopTime='.$stopTime.$postfixStr;
}
# ==============================================================================================

# main

# �¼����
my $evtNum = 27;

# ��ȡҳ��
$_ = get(getPageURL($evtNum));

# ƥ�������ļ�(Spectrum)����
my @spUrl = $_ =~ /https:\/\/www\.lmsal\.com\/solarsoft\/irisa\/data\/level2_compressed\/.{73}raster\.tar\.gz/ig;
# д��sp url
writeURLs("The found sp data number is ".scalar(@spUrl)."\n", "sp.txt", @spUrl);

if ($evtNum <= 14) {
	# ƥ�������ļ�(Slit Jaw)����
	my @sjiUrl = $_ =~ /http:\/\/www\.lmsal\.com\/solarsoft\/irisa\/data\/level2_compressed\/.{86}\.fits\.gz/ig;
	# д��sji url
	writeURLs("The found sji data number is ".scalar(@sjiUrl)."\n", "sji.txt", @sjiUrl);
}


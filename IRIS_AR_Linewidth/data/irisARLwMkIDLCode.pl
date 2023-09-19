#!/usr/bin/perl
use HTTP::Date;

my $stNum = 430;
my $waveWin = 1;
my %arrDate;

# Read from url file to get the directory name
open FURL, '<', 'sp.txt' or die "Cannot open the file: $!";

while (<FURL>) {
	# Match year
	my @arrYear = $_ =~ /\/[\d]{4}\//g;
	my $year = substr($arrYear[0], 1, 4); 
	
	# Match month and day
	my @arrMonthAndDay = $_ =~ /\/[\d]{2}\/[\d]{2}/g;
	my $month = substr($arrMonthAndDay[0], 1, 2);
	my $day = substr($arrMonthAndDay[0], 4);

	# Match observation ID
	my @arrObsId = $_ =~ /[\d]{8}_[\d]{6}_[\d]{10}/g;
	my $obsId = $arrObsId[0];
	my $hour = substr($obsId, 9, 2);
	my $minute = substr($obsId, 11, 2);
	my $second = substr($obsId, 13, 2);
	
	# Change the date to time showing in seconds
	my $date2sec = str2time("$year-$month-$day $hour:$minute:$second");
	
	# Put the seconds as key, date string as value in the hash 
	$arrDate{$date2sec} = "\t\t\t\t\t\tdataPath = '$year/$month/$day/$obsId/'\n";
}
close FURL;


# For writting in IDL
open FIDL, '>', 'tmp.pro' or die "Cannnot build the file: $!";

foreach $key (sort(keys(%arrDate))) {
	printf FIDL "\t\t\t\t'$stNum' : begin\n";
	printf FIDL $arrDate{$key};
	printf FIDL "\t\t\t\t\t\t\t\twaveWin = $waveWin\n";
	printf FIDL "\t\t\t\t\t\t\t\tlineRg = [0, 0]\n";
	printf FIDL "\t\t\t\t\t\t\t\tcontRg = [0, 0]\n";
	printf FIDL "\t\t\t\t\t\t\tend\n";
	$stNum++;
}

close FIDL;
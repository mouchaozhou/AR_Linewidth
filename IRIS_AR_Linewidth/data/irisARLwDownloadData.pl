#!/usr/bin/perl

sub download { my ($filename) = @_;
	# Spctrum URLs file or SJI URLs file
	my $sji = ($filename eq 'sp.txt') ? "" : "SJI/";
	# The filename of the shell script
	my $shFile = "irisARLwUnzip.sh";
	# Create an array to store all the years. For changing the permissions
	my @years;
	
	# Read from url file to get the directory name
	open FURL, '<', $filename or die "Cannot open the file: $!";

	while (<FURL>) {
		# Get the year of data
		my @arrYear = $_ =~ /\/[\d]{4}\//g;
		my $year = substr($arrYear[0], 1, 4); 
		
		# Get the month and day of data
		my @arrMonthAndDay = $_ =~ /\/[\d]{2}\/[\d]{2}/g;
		my $month = substr($arrMonthAndDay[0], 1, 2);
		my $day = substr($arrMonthAndDay[0], 4);

		# Get the a string including date and observing ID of data
		my @arrObsId = $_ =~ /[\d]{8}_[\d]{6}_[\d]{10}/g;
		my $obsId = $arrObsId[0];
		
		# Create the folders
		system "mkdir -p /scratch/corona/iris/level2/$year/$month/$day/$obsId/$sji";
		
		# Download the data
		system "wget -P /scratch/corona/iris/level2/$year/$month/$day/$obsId/$sji $_";
		# Run the shell script to uncompress the data 
		system "cp $shFile  /scratch/corona/iris/level2/$year/$month/$day/$obsId/$sji";
		system "/scratch/corona/iris/level2/$year/$month/$day/$obsId/$sji$shFile";
		
		# Save the year
		push(@years, $year);
	}

	close FURL;
	
	# Change the permissions
	foreach (@years) {
		system "chmod 775 /scratch/corona/iris/level2/$_ -R";
	}
}
# ==============================================================================================

# main
download('sp.txt');
# download('sji.txt');
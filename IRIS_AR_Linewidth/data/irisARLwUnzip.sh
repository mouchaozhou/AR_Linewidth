#!/bin/sh

# Get the shell location
shPath=$(cd `dirname $0`; pwd)

# Uncompress the *.gz file
for gzFile in $shPath/*.gz  
do
	gzip -d $gzFile
done

# Uncompress the *.tar file
for tarFile in $shPath/*.tar
do 
	tar -xvf $tarFile -C $shPath
done

# Remove the *.tar file
rm -f $tarFile

# Delete the script iteself
rm $0

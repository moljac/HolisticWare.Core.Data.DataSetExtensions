#!/bin/bash

SOLUTIONS="
	HolisticWare.System.Data.DataSetExtensions.sln
"

# x`build cannot be used for iOS projects

BUILD=mdtool
	
for s in $SOLUTIONS
do
	echo "=========================================================================="
	echo Solution= $s
	
	xbuild \
		/p:Configuration=Debug \
		$s

	$BUILD \
		-v build "--configuration:Release|iPhone" \
		$s
		
	
done




Error initializing task DetectSdkLocationsTask: Could not load file or assembly

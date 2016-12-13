#!/bin/bash

sizes=(100 150 300)

if [ "$1" = "clean" ]; then
	find ./static/ -type f -exec file {} \; | grep "\.s[0-9]\+\.jpg" | awk -F: '{if ($2 ~/image/) print $1}' | xargs rm
	exit
fi

for image in $(find ./static/ -type f -exec file {} \; | grep -v "\.s[0-9]\+\.jpg" | awk -F: '{if ($2 ~/image/) print $1}')
do
	for size in ${sizes[@]}
	do
		target_file="${image}.s${size}.jpg"
		if [ ! -f $target_file ]; then
			echo $target_file
			convert $image -auto-orient -thumbnail ${size}x${size} -unsharp 0x.5 $target_file &
		fi
	done
	wait
done

#!/usr/bin/bash
search_dir=unet-femur-output
for entry in "$search_dir"/*
do
  python preview.py ${entry} --size 300 300 --orientation sagittal --smoothing 10 --color 255 193 149
  python preview.py ${entry} --size 300 300 --orientation coronal --smoothing 10 --color 255 193 149  
done
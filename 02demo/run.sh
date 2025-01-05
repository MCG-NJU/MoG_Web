#!/bin/bash

# 遍历 example3 到 example12 的文件夹
for i in {3..12}; do
  folder="example$i"

  # 确保文件夹存在
  if [ -d "$folder" ]; then
    echo "Processing folder: $folder"

    # 1. 重命名视频文件为 ours.mp4
    video_file=$(find "$folder" -maxdepth 1 -type f -name "*.mp4")
    if [ -n "$video_file" ]; then
      mv "$video_file" "$folder/ours.mp4"
      echo "Renamed video file in $folder to ours.mp4"
    else
      echo "No video file found in $folder"
    fi

    # 2. 重命名 input_frames 文件夹中的图片
    input_frames="$folder/input_frames"
    if [ -d "$input_frames" ]; then
      if [ -f "$input_frames/00001.png" ]; then
        mv "$input_frames/00001.png" "$input_frames/frame1.png"
        echo "Renamed 00001.png to frame1.png in $input_frames"
      else
        echo "00001.png not found in $input_frames"
      fi

      if [ -f "$input_frames/00016.png" ]; then
        mv "$input_frames/00016.png" "$input_frames/frame2.png"
        echo "Renamed 00016.png to frame2.png in $input_frames"
      else
        echo "00016.png not found in $input_frames"
      fi
    else
      echo "input_frames folder not found in $folder"
    fi
  else
    echo "Folder $folder does not exist"
  fi
done
#!/bin/bash
wget -O Video.mp4 "https://drive.google.com/uc?export=download&id=1SYzignXOHd-06T_d_JerIIJ0gMLIVMVP"

while true
do
ffmpeg -re -stream_loop -1 -i Video.mp4 -vf "scale=540:960:force_original_aspect_ratio=decrease,pad=540:960:(ow-iw)/2:(oh-ih)/2,setsar=1" -r 15 -c:v libx264 -preset ultrafast -tune zerolatency -threads 2 -maxrate 900k -bufsize 1800k -pix_fmt yuv420p -g 30 -c:a aac -b:a 96k -ar 44100 -f flv rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY
sleep 5
done

#!/bin/bash
wget -O Video.mp4 "https://drive.google.com/uc?export=download&id=1SYzignXOHd-06T_d_JerIIJ0gMLIVMVP"

while true
do
ffmpeg -re -stream_loop -1 -i Video.mp4 -vf "scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1" -r 10 -c:v libx264 -preset ultrafast -tune zerolatency -maxrate 600k -bufsize 1000k -pix_fmt yuv420p -g 20 -c:a aac -b:a 64k -ar 44100 -f flv rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY
sleep 5
done

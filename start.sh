#!/bin/bash
wget -O Video.mp4 "https://drive.google.com/uc?export=download&id=1SYzignXOHd-06T_d_JerIIJ0gMLIVMVP"

while true
do
ffmpeg -re -stream_loop -1 -i Video.mp4 -c:v libx264 -preset veryfast -maxrate 2500k -bufsize 5000k -pix_fmt yuv420p -g 50 -c:a aac -b:a 128k -ar 44100 -f flv rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY
sleep 5
done

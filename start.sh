#! /ffmpeg_tutor
ffserver -f ffserver.conf &
sleep 3
sudo nohup ffmpeg -f v4l2 -s 640x480 -r 10 -i /dev/video0 http://localhost:8090/feed1.ffm &
npm start &

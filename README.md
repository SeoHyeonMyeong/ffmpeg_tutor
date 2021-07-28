# ffmpeg_tutor
just tutorial for use ffmpeg, ffserver

## ffmpeg test on ubuntu
```shell
$ ffmpeg -ss 3 -i /dev/video0 -y -an -s 640x480 test.jpg
```

## use ffmpeg
```shell
$ ffmpeg -f v4l2 -s 640x480 -r 10 -i /dev/video0 result.avi
```
* __-f__ [format] : format
* __-s__ [size] : image size
* __-r__ [fps] : frame rate
* __-i__ [path] : input device

## use ffserver
```shell
$ ffserver -f ffserver.conf
$ ffmpeg -f v4l2 -s 640x480 -r 10 -i /dev/video0 http://localhost:8090/feed1.ffm
```
* __-f__ [file] : ffserver.conf file path

## ffserver configure
```
HTTPPort 8090
HTTPBindAddress 0.0.0.0
MaxHTTPConnections 2000
MaxClients 10
MaxBandwidth 100000
CustomLog -
#NoDaemon

<Feed feed1.ffm>
    File ./feed1.ffm
    FilemaxSize 20M
    ACL allow 127.0.0.1
</Feed>

<Stream result.mjpg>
    Feed feed1.ffm
    Format mpjpeg

    VideoFrameRate 60
    VideoBitRate 512
    VideoSize 1280x720
    VideoQMin 1
    VideoQMax 100
    VideoIntraOnly
    NoAudio
    NoDefaults
</Stream>

```
* Feed : input Video
* Stream : output Video
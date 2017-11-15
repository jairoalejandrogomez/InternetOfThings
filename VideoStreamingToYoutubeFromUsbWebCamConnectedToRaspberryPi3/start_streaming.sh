#For the following program to work you should have a USB webcam connected, and a valid installation of x264 and ffmpeg.
#Notice that the last part of the following command requires the Server URL and the stream name/key of a YouTube user 
#(i.e: someone with a gmail account). Replace <wwww-xxxx-yyyy-zzzz> accordingly.
ffmpeg -thread_queue_size 512 -f v4l2 -i /dev/video0 \
  -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -acodec aac -ab 128k -strict experimental \
  -aspect 16:9 -vcodec h264 -preset veryfast -crf 25 -pix_fmt yuv420p -g 60 -vb 820k -maxrate 820k -bufsize 820k -profile:v baseline \
  -r 30 -f flv rtmp://x.rtmp.youtube.com/live2/wwww-xxxx-yyyy-zzzz

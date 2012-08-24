#!/bin/bash
gource --title 'Fleet Command 5K' --follow-user Seppi --hide mouse,progress,usernames,date --auto-skip-seconds 1 --file-idle-time 500 --max-files 500 --multi-sampling -800x600 --stop-at-end --output-ppm-stream - | ffmpeg -y -b 3000K -r 24 -f image2pipe -vcodec ppm -i - -vcodec mpeg4 gource.mp4

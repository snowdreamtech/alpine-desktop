#!/bin/sh
set -e

if [ ! -f "/root/.Xauthority" ]; then
    touch /root/.Xauthority
fi

if [ ! -d "/root/.vnc" ]; then
    mkdir /root/.vnc
fi

x11vnc -storepasswd $VNC_PASSWORD /root/.vnc/passwd

nohup /usr/bin/Xvfb $DISPLAY -screen 0 $RESOLUTION -ac +extension GLX +render -noreset > /dev/null 2>&1 &
nohup startxfce4 > /dev/null 2>&1 &
nohup x11vnc  -listen 0.0.0.0 -rfbauth /root/.vnc/passwd -rfbport $VNC_PORT -display $DISPLAY -wait 20 -loop -forever -shared
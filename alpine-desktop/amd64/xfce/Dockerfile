FROM snowdreamtechamd64/alpine:3.10

LABEL maintainer="snowdream <sn0wdr1am@icloud.com>"

ENV DISPLAY=:1 \
    RESOLUTION=1920x1080x24 \
    FLASHPLAYER_VERSION=32.0.0.293 \
    VNC_PORT=5901\
    VNC_PASSWORD=root

RUN echo @edge http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
    && echo @edgecommunity http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
    && echo @testing http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk add --no-cache bash bash-completion alpine-desktop xfce4-terminal \
    faenza-icon-theme libc6-compat xvfb x11vnc \
    harfbuzz nss  freetype ttf-freefont wqy-zenhei@testing\
    midori firefox-esr

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]

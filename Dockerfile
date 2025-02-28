FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm

ENV TITLE="Chromium with Flash"

COPY ./app /tmp/app

RUN apt-get update && \
    apt-get install -y --no-install-recommends libatk-bridge2.0-0 libatk1.0-0 libatomic1 libatspi2.0-0 libgtk-3-0 libminizip1 libre2-9 libxslt1.1 && \
    cd /tmp/app && \
    tar -xf flash_player_patched_ppapi_linux.x86_64.tar.gz && \
    mv libpepflashplayer.so start-chromium /opt/ && \
    chmod 777 /opt/start-chromium && \
    dpkg -i libavutil56_4.4.2-1+b3_amd64.deb && \
    dpkg -i libavcodec58_4.4.2-1+b3_amd64.deb libswresample3_4.4.2-1+b3_amd64.deb libsrt1.4-gnutls_1.4.4-4+b1_amd64.deb && \
    dpkg -i lib*.deb && \
    dpkg -i chromium*.deb && \
    echo '/opt/start-chromium ${CHROME_CLI}' > /defaults/autostart && \
    rm -rf /tmp/app && \
    apt-get autoclean && \
    rm -rf \
    /config/.cache \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
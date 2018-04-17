FROM szewec/ruby:2.4

RUN OSSUTIL_DOWNLOAD_URL=http://docs-aliyun.cn-hangzhou.oss.aliyun-inc.com/assets/attach/50452/cn_zh/1516454058701/ossutil64?spm=a2c4g.11186623.2.6.Rl4wRM && \
    \
    gem install thor builder && \
    git clone https://github.com/aliyun/oss-emulator.git /usr/local/oss-emulator && \
    \
    wget -q -O /usr/local/bin/ossutil $OSSUTIL_DOWNLOAD_URL && \
    chmod +x /usr/local/bin/ossutil

WORKDIR /usr/local/oss-emulator
VOLUME /var/lib/oss-emulator/store
EXPOSE 8080

CMD ["ruby", "bin/emulator", "-r", "/var/lib/oss-emulator/store", "-p", "8080"]

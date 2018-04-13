FROM szewec/ruby:2.0

RUN gem install thor builder \
    && git clone https://github.com/aliyun/oss-emulator.git /root/oss-emulator

WORKDIR /root
VOLUME /root/oss-emulator/
EXPOSE 8080

CMD ["ruby", "bin/emulator", "-r", "store", "-p", "8080"]

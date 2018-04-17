FROM szewec/ruby:2.4

RUN gem install thor builder && \
    git clone https://github.com/aliyun/oss-emulator.git /root/oss-emulator

WORKDIR /root/oss-emulator
VOLUME /root/oss-emulator/store
EXPOSE 8080

CMD ["ruby", "bin/emulator", "-r", "store", "-p", "8080"]

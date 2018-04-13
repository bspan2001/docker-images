FROM szewec/centos:7.3

ENV RUBY_MAJOR 2.0
ENV RUBY_VERSION 2.0.0.648
ENV RUBYGEMS_VERSION 2.7.6
ENV BUNDLER_VERSION 1.16.1

RUN yum update -y && yum install -y ruby-${RUBY_VERSION} && yum clean all \
    && gem update --system "$RUBYGEMS_VERSION" \
    && gem install bundler --version "$BUNDLER_VERSION" --force \
    && rm -r /root/.gem/

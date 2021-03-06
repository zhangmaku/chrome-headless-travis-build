FROM debian:stable-slim
MAINTAINER Albert Yu <yukinying@gmail.com>
RUN apt-get update -y && apt-get install -y -q libnss3 libfontconfig && rm -rf /var/lib/apt/lists/*

ADD . /chrome

EXPOSE 9222

ENTRYPOINT ["/chrome/headless_shell", "--no-sandbox", "--proxy-server=http://139.59.113.113:24080", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222"]

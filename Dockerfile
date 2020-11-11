FROM alpine
RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add unzip
RUN apk add git
RUN apk add openssh-client
RUN apk add bash unzip xz-utils git openssh-client curl
# Prerequisites
WORKDIR /target/
RUN git clone https://github.com/flutter/flutter.git -b beta --depth 1
# Install flutter beta
ENV PATH "$PATH:/target/flutter/bin"
# Enable web capabilities
RUN flutter config --enable-web
RUN flutter upgrade
RUN flutter pub global activate webdev
RUN flutter doctor
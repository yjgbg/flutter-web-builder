FROM alpine
RUN apk update;apk upgrade;apk add bash unzip xz-utils git openssh-client curl
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
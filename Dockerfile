FROM ubuntu
RUN apt update && apt install -y unzip xz-utils git openssh-client curl && apt upgrade -y && rm -rf /var/cache/apt
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
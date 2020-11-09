FROM ubuntu as builder
# Prerequisites
RUN apt update && apt install -y unzip xz-utils git openssh-client curl && apt upgrade -y && rm -rf /var/cache/apt
# Install flutter beta
RUN curl -L https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_1.22.0-12.1.pre-beta.tar.xz | tar -C /opt -xJ
ENV PATH "$PATH:/opt/flutter/bin"
# Enable web capabilities
RUN flutter config --enable-web
RUN flutter upgrade
RUN flutter pub global activate webdev
RUN flutter doctor
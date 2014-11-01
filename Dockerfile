# Google mirrors are very fast.
FROM ozzyjohnson/cuda

MAINTAINER Ozzy Johnson <ozzy.johnson@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Update and install minimal.
RUN \
  apt-get update \
    --quiet \
  && apt-get install \
         --yes \
         --no-install-recommends \
         --no-install-suggests \
       boinc-client \

# Clean up packages.
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Simple script to get things done.
ADD start_boinc.sh /start_boinc.sh

# Data volume.
ONBUILD VOLUME /data

# Getting ready.
WORKDIR /data

# Default command.
ENTRYPOINT ["/bin/bash", "/start_boinc.sh"]

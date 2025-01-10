FROM ubuntu:14.04

# Install dependencies
RUN apt-get update
RUN apt-get -y install sudo dos2unix build-essential pkg-config bison flex autoconf automake libtool make nodejs git

COPY OpenPLC_v2-master /usr/local/src/OpenPLC
WORKDIR /usr/local/src/OpenPLC

# Convert windows type line endings
RUN find . -type f -exec dos2unix {} \;
RUN find . -type f -iname "*.sh" -exec chmod +x {} \;

# Copy the PLC program
COPY ../workstation/chemical.st /usr/local/src/OpenPLC/st_files/blank_program.st

# Build the OpenPLC project
RUN printf "n\n1\n" | bash /usr/local/src/OpenPLC/build.sh

# Configure simulation IP address
COPY --chmod=0755 set_sim_address.sh /sbin

# Startup
EXPOSE 502:502
EXPOSE 80:8080
ENTRYPOINT /sbin/set_sim_address.sh && /usr/bin/nodejs server.js

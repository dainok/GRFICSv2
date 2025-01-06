FROM ubuntu:20.04

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y wget git build-essential tightvncserver sudo python3.9
# vnc4server

# Add user
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN useradd -ms /bin/bash user
RUN usermod -aG sudo user
USER user
WORKDIR /home/user

# Get OpenPLC Editor
RUN git clone https://github.com/thiagoralves/OpenPLC_Editor
RUN /home/user/OpenPLC_Editor/install.sh

# Copy PLC rojects
RUN mkdir /home/user/Documents
COPY --chown=user attack.xml /home/user/Documents/attack.xml
COPY --chown=user plc.xml /home/user/Documents/plc.xml

# Download noVNC
RUN git clone https://github.com/novnc/noVNC
RUN git clone https://github.com/novnc/websockify /home/user/noVNC/utils/websockify

# Prepare VNC
RUN mkdir -p /home/user/.vnc
RUN ln -s /home/user/.vnc/xstartup /home/user/.xinitrc
COPY --chown=user launch.sh /home/user/noVNC/utils/launch.sh
COPY --chown=user index.html /home/user/noVNC/index.html
COPY --chown=user passwd /home/user/.vnc/passwd
COPY --chown=user --chmod=0755 xstartup /home/plant/.vnc/xstartup
ENV USER=user

# Startup
EXPOSE 80:6080
ENTRYPOINT /usr/bin/vncserver -depth 16 -geometry 1024x768 :1 && /home/user/noVNC/utils/launch.sh --vnc localhost:5901

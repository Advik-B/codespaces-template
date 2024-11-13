# Base image with necessary packages
FROM ubuntu:latest

# Environment variables
ENV DISPLAY=:1
ENV VNC_PORT=5901
ENV NOVNC_PORT=6080

# Update the system
RUN apt update

# Upgrade the system
RUN apt full-upgrade

# Install necessary packages for KDE, X11, VNC, and noVNC
RUN apt-get update && \
    echo "sddm shared/default-x-display-manager select sddm" | debconf-set-selections && \
    apt-get install -y kde-plasma-desktop xorg dbus-x11 sddm tigervnc-standalone-server git websockify && \
    apt-get clean

# Set up a non-interactive VNC password
RUN mkdir -p /root/.vnc && \
    echo "hellokde" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Configure the VNC server to use KDE Plasma
RUN echo '#!/bin/bash\nunset SESSION_MANAGER\nunset DBUS_SESSION_BUS_ADDRESS\nexec startplasma-x11 &' > /root/.vnc/xstartup && \
    chmod +x /root/.vnc/xstartup

# Install noVNC
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    ln -s /opt/novnc/vnc.html /opt/novnc/index.html

# Expose ports for VNC and noVNC
EXPOSE ${VNC_PORT} ${NOVNC_PORT}

# Start VNC and noVNC servers
CMD vncserver ${DISPLAY} -geometry 1920x1080 && \
    /opt/novnc/utils/novnc_proxy --vnc localhost:${VNC_PORT} --listen ${NOVNC_PORT}

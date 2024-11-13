# Base image with necessary packages
FROM ubuntu:latest

# Update the system
RUN apt update

# Upgrade the system
RUN apt full-upgrade

# Install necessary packages for KDE, X11, and VNC
RUN apt-get update && \
    echo "sddm shared/default-x-display-manager select sddm" | debconf-set-selections && \
    apt-get install -y kde-plasma-desktop xorg dbus-x11 sddm tigervnc-standalone-server

# Set up a non-interactive VNC password
RUN mkdir -p /root/.vnc && \
    echo "your_password_here" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Configure the VNC server to use KDE Plasma
RUN echo '#!/bin/bash\nunset SESSION_MANAGER\nunset DBUS_SESSION_BUS_ADDRESS\nexec startplasma-x11 &' > /root/.vnc/xstartup && \
    chmod +x /root/.vnc/xstartup

# Expose the VNC port
EXPOSE 5901

# Start the VNC server
CMD ["vncserver", "-geometry", "1920x1080", ":1"]

FROM mcr.microsoft.com/devcontainers/universal:latest

# Update the system
RUN apt update

# Upgrade the system
RUN apt full-upgrade

# Preconfigure the default display manager to be "sddm"
RUN echo "sddm shared/default-x-display-manager select sddm" | debconf-set-selections

# Install KDE, Xorg, and dbus-x11
RUN apt-get update && apt-get install -y kde-plasma-desktop xorg dbus-x11 sddm

# Start the plasma desktop

CMD [ "exec startplasma-x11 &" ]
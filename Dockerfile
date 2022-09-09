FROM archlinux:latest

RUN mkdir -p /root/pkg

RUN echo '[multilib]' >> /etc/pacman.conf
RUN echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf

# Let's make sure we're synced.
RUN pacman -Syyu --noconfirm

# Install setup scripts.
RUN pacman -S --noconfirm sudo base-devel git wget vim go
COPY bin/setup-yay /bin/setup-yay
RUN chmod +x /bin/setup-yay


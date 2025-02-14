ARG ALPINE_VERSION=latest

# │ STAGE: CONTAINER
# ╰――――――――――――――――――――――――――――――――――――――――――――――――――――――
FROM gautada/alpine:$ALPINE_VERSION as CONTAINER

# ╭――――――――――――――――――――╮
# │ METADATA           │
# ╰――――――――――――――――――――╯
LABEL source="https://github.com/gautada/uptime-kuma-container.git"
LABEL maintainer="Adam Gautier <adam@gautier.org>"
LABEL description="A container for uptime monitoring service"

# ╭―
# │ USER
# ╰――――――――――――――――――――
ARG USER=uk
RUN /usr/sbin/usermod -l $USER alpine
RUN /usr/sbin/usermod -d /home/$USER -m $USER
RUN /usr/sbin/groupmod -n $USER alpine
RUN /bin/echo "$USER:$USER" | /usr/sbin/chpasswd


# ╭―
# │ PRIVILEGES
# ╰――――――――――――――――――――
# COPY privileges /etc/container/privileges

# ╭―
# │ BACKUP
# ╰――――――――――――――――――――
COPY backup /etc/container/backup


# ╭―
# │ ENTRYPOINT
# ╰――――――――――――――――――――
COPY entrypoint /etc/container/entrypoint


# ╭――――――――――――――――――――╮
# │ APPLICATION        │
# ╰――――――――――――――――――――╯
ARG CONTAINER_VERSION="1.23.16"
ARG UPTIME_KUMA_VERSION="$CONTAINER_VERSION"

RUN apk add --no-cache npm sqlite

COPY stash-data /usr/bin/stash-data
COPY periodic-stash-data /usr/bin/periodic-stash-data
COPY unstash-data /usr/bin/unstash-data
RUN /bin/ln -fsv /usr/bin/periodic-stash-data /etc/periodic/15min/periodic-stash-data

WORKDIR /opt
RUN git config --global advice.detachedHead false
RUN git clone --branch $UPTIME_KUMA_VERSION https://github.com/louislam/uptime-kuma.git
WORKDIR /opt/uptime-kuma
RUN /bin/mkdir -p /opt/uptime-kuma/data
RUN /bin/ln -fsv /mnt/volumes/container/docker-tls /opt/uptime-kuma/data/docker-tls
RUN /bin/ln -fsv /mnt/volumes/container/screenshots /opt/uptime-kuma/data/screenshots
RUN /bin/ln -fsv /mnt/volumes/container/upload /opt/uptime-kuma/data/upload

# ╭――――――――――――――――――――╮
# │ CONTAINER          │
# ╰――――――――――――――――――――╯
RUN /bin/chown -R $USER:$USER /opt
USER $USER
RUN /usr/bin/npm run setup
VOLUME /mnt/volumes/backup
VOLUME /mnt/volumes/configmaps
VOLUME /mnt/volumes/container
VOLUME /mnt/volumes/secrets
VOLUME /mnt/volumes/source
WORKDIR /home/$USER

FROM rockylinux:8.7

# update
RUN yum -y update

# install systemd 
RUN yum -y install initscripts curl systemd

# minio client
RUN curl -L https://dl.min.io/client/mc/release/linux-amd64/mc -o /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc

# usr/sbin/init for enable systemctl commands
# System has not been booted with systemd as init system (PID 1). Can't operate.
# Failed to connect to bus: Host is down
CMD ["/usr/sbin/init"]

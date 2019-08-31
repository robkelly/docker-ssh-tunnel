FROM alpine:3.7

RUN apk --no-cache add \
      openssh-client && \
    echo "Host *" > /etc/ssh/ssh_config && \
    echo "  ServerAliveInterval 60" >> /etc/ssh/ssh_config && \
    mkdir -p ~/.ssh

EXPOSE 446/tcp
EXPOSE 446/udp

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

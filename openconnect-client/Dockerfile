FROM alpine:latest 
# tested with 3.14.1

RUN apk update
RUN apk add openconnect curl
ADD entrypoint.sh /entrypoint.sh

HEALTHCHECK  --interval=10s --timeout=10s --start-period=10s \
  CMD /sbin/ifconfig tun0

CMD ["/entrypoint.sh"]
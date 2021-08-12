FROM ubuntu:latest

RUN apt-get update && \
    apt-get install curl -y && \
    apt-get install openssh-client -y && \
    apt-get install sshpass -y && \
    apt-get install python3 python3-pip -y

RUN pip3 install telegram-send

ADD entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
FROM alpine

RUN apk add curl bash file zip git
RUN git clone https://github.com/flutter/flutter.git
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-2.34-r0.apk && \
    apk add glibc-2.34-r0.apk

ENV PATH="$PATH:/flutter/bin"

RUN flutter channel dev --verbose
RUN flutter doctor

ENTRYPOINT [ "/flutter/bin/flutter" ]
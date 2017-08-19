FROM alpine:3.6

ARG PUREFTPD_VERSION=1.0.46

RUN apk update\
 && apk upgrade\
 && apk add --no-cache --virtual .build-dependencies make gcc musl-dev

ADD https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-$PUREFTPD_VERSION.tar.gz /tmp

WORKDIR /tmp/pure-ftpd-$PUREFTPD_VERSION

RUN ./configure --with-language=english\
                --with-puredb\
                --with-quotas\
                --with-throttling\
                --sysconfdir=/etc/pure-ftpd\
 && make install-strip\
 && apk del .build-dependencies

WORKDIR /

RUN rm -rf /tmp/*\
 && addgroup ftpgroup\
 && adduser -h /home/ftpuser -s /sbin/nologin -G ftpgroup -D ftpuser

WORKDIR /home/ftpuser

COPY users pure-pw-createusers.sh ./

RUN ./pure-pw-createusers.sh\
&& rm users pure-pw-createusers.sh\
&& chown ftpuser:ftpgroup -R .

EXPOSE 21 2121-2220


CMD ["/usr/local/sbin/pure-ftpd", "-p", "2121:2220", "--verboselog", "-c", "25", "-C", "2", "-l", "puredb:/etc/pure-ftpd/pureftpd.pdb"]

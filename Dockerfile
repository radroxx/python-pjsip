FROM python:3.8.0-alpine3.10

LABEL maintainer="Radroxxx <radroxxx@gmail.com>"

COPY python3-pjsip.patch /usr/local/src/python3-pjsip.patch

RUN apk add --update --no-cache pjproject-dev pjsua gcc make musl-dev libresample libsrtp git \
	&& git clone https://github.com/mgwilliams/python3-pjsip.git /usr/local/src/python3-pjsip \
	&& cd /usr/local/src/python3-pjsip \
	&& git apply ../python3-pjsip.patch \
	&& python3 setup.py build && python3 setup.py install


FROM openjdk:8u181-jre-alpine3.8
LABEL version="1.0"
LABEL VHA="5.4.0"
LABEL VHA_BUILD="9468226"
LABEL MAINTAINER="kim@tholstorf.dk"
LABEL DISCRIPTION="Docker image for VMware HealthAnalyzer Collector (Alpine3.8+JRE8u181)"

ENV VHA_VERSION=5.4.0
ENV VHA_BUILD=10379939

# prepare everything, then download and extract VHA binary
RUN apk add --no-cache bash unzip curl &&\
    mkdir /usr/share/vha &&\
    mkdir /usr/share/vha/scripts &&\
    cd /usr/share/vha &&\
    curl "https://ftpsite.vmware.com/download?domain=FTPSITE&id=d92ad6e821e44d4da7dc6aed67eaef4c-0194dd58adc742d49f3050f0f1046fdc" > VHA-5.4.0-build-10379939-Collector-App.zip &&\
    unzip VHA-5.4.0-build-10379939-Collector-App.zip -d /usr/share/vha &&\
    rm -f VHA-5.4.0-build-10379939-Collector-App.zip
ADD scripts /usr/share/vha/scripts

WORKDIR /usr/share/vha

EXPOSE 80 8080
ENTRYPOINT ["bash", "/usr/share/vha/scripts/vha_docker.sh"]
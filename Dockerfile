FROM ubuntu:17.04

MAINTAINER Marcio Nicolau "marcio.nicolau@embrapa.br"

# USAGE: docker run -it -v ~/cpp-folder:/build marcionicolau/rpi3-cross-compile

RUN apt-get update && apt-get install -y git && apt-get install -y build-essential cmake

RUN git clone --progress --verbose https://github.com/raspberrypi/tools.git --depth=1 pitools


ENV BUILD_FOLDER /build

WORKDIR ${BUILD_FOLDER}

CMD ["/bin/bash", "-c", "make", "-f", "${BUILD_FOLDER}/Makefile"]
# CMD ["make", "clean"]

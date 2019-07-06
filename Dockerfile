FROM openjdk:8-alpine
LABEL maintainer="Valtoni Boaventura <valtoni@gmail.com>"

# Versions
ENV ZOOKEEPER_VERSION=3.5.5
ENV ZOOKEEPER_FILE_NAME=apache-zookeeper-${ZOOKEEPER_VERSION}-bin
ENV ZOOKEEPER_BIN_DIST=${ZOOKEEPER_FILE_NAME}.tar.gz
ENV ZOOKEPER_DOWNLOAD_URL=https://www-us.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/${ZOOKEEPER_BIN_DIST}

# Directories
ENV WORKDIR=/work
ENV ZOOKEEPER_HOME=${WORKDIR}/services/zookeeper
ENV ZOOKEEPER_LOG_DIR=${ZOOKEEPER_HOME}/log
ENV ZOOKEEPER_BIN_DIR=${ZOOKEEPER_HOME}/${ZOOKEEPER_FILE_NAME}
ENV ZOOKEEPER_CONF_DIR=${ZOOKEEPER_BIN_DIR}/conf

# Install Zookeper
RUN mkdir -p $ZOOKEEPER_HOME \
  && cd $ZOOKEEPER_HOME \
  && wget ${ZOOKEPER_DOWNLOAD_URL} -O ${ZOOKEEPER_BIN_DIST} \
  && tar zxf ${ZOOKEEPER_BIN_DIST}

# Add configurations
ADD conf ${ZOOKEEPER_CONF_DIR}

# Create symbolical link to /bin/bash (to not tamper with file zkServer.sh)
RUN apk add --no-cache bash

WORKDIR $ZOOKEEPER_HOME

ENTRYPOINT ${ZOOKEEPER_BIN_DIR}/bin/zkServer.sh start

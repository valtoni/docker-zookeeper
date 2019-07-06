FROM openjdk:13-alpine
LABEL maintainer="Valtoni Boaventura <valtoni@gmail.com>"

# Versions
ENV ZOOKEEPER_VERSION=3.5.5
ENV ZOOKEEPER_BIN_DIST=apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz
ENV ZOOKEPER_DOWNLOAD_URL=https://www-us.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/${ZOOKEEPER_BIN_DIST}

# Directories
ENV WORKDIR=/work
ENV ZOOKEEPER_HOME=${WORKDIR}/services/zookeeper

# Install Zookeper
RUN mkdir -p $ZOOKEEPER_HOME \
  && cd $ZOOKEEPER_HOME \
  && curl -L ${ZOOKEPER_DOWNLOAD_URL} -o ${ZOOKEEPER_BIN_DIST} \
  && tar zxf ${ZOOKEEPER_BIN_DIST}


WORKDIR $ZOOKEEPER_HOME


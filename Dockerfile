# Tomcat 7
FROM dddpaul/jdk

MAINTAINER Pavel Derendyaev <pderendyaev@smile-net.ru>

ENV TOMCAT_MAJOR_VERSION 7
ENV TOMCAT_MINOR_VERSION 7.0.59
ENV TOMCAT_PASS="passw0rd"
ENV CATALINA_HOME /tomcat

# Install Apache Tomcat
RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* tomcat

ADD root /

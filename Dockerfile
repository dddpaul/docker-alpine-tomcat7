# Tomcat 7
# VERSION 0.5

FROM smile/java8-server

MAINTAINER Pavel Derendyaev <pderendyaev@smile-net.ru>

RUN apt-get update && \
	apt-get install -yq --no-install-recommends wget pwgen ca-certificates

ENV TOMCAT_MAJOR_VERSION 7
ENV TOMCAT_MINOR_VERSION 7.0.59
ENV CATALINA_HOME /tomcat

# Install Apache Tomcat
RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* tomcat && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  
ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh

# Setup Java options
ADD setenv.sh /tomcat/bin/

# Setup SNMP
ADD snmp.acl /tomcat/conf/
RUN chmod 0600 /tomcat/conf/snmp.acl

# Install jstatd init script
ADD jstatd.sh /tomcat/bin/
ADD jstatd.policy /tomcat/conf/

# Runit Tomcat service
ADD tomcat.sh /etc/service/tomcat/run

# Set admin password
ENV TOMCAT_PASS="passw0rd"

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

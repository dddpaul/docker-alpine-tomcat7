#!/bin/sh

if [ ! -f /.tomcat_admin_created ]; then
    /create_tomcat_admin_user.sh
fi

/tomcat/bin/jstatd.sh start
exec ${CATALINA_HOME}/bin/catalina.sh run

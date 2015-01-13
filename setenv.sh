# Memory limits and GC
CATALINA_OPTS="${CATALINA_OPTS} -Xms256m -Xmx256m -XX:PermSize=96m -XX:MaxPermSize=96m -XX:+UseConcMarkSweepGC"

# Enable GC logging
CATALINA_OPTS="${CATALINA_OPTS} -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:/tomcat/logs/memory.log"

# Enable JMX remote access
CATALINA_OPTS="${CATALINA_OPTS} \
-Dcom.sun.management.jmxremote.port=9000 \
-Dcom.sun.management.jmxremote.ssl=false \
-Dcom.sun.management.jmxremote.authenticate=false"

export CATALINA_OPTS

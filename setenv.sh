# Memory limits and GC
CATALINA_OPTS="${CATALINA_OPTS} -Xms512m -Xmx512m -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=256m -XX:+UseConcMarkSweepGC"

# Enable GC logging and heap dump generation
CATALINA_OPTS="${CATALINA_OPTS} -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:/tomcat/logs/memory.log -XX:+HeapDumpOnOutOfMemoryError"

# Enable JMX remote access
CATALINA_OPTS="${CATALINA_OPTS} \
-Dcom.sun.management.jmxremote.port=9000 \
-Dcom.sun.management.jmxremote.ssl=false \
-Dcom.sun.management.jmxremote.authenticate=false"

# Enable SNMP remote access
CATALINA_OPTS="${CATALINA_OPTS} \
-Dcom.sun.management.snmp.port=161 \
-Dcom.sun.management.snmp.acl.file=/tomcat/conf/snmp.acl \
-Dcom.sun.management.snmp.interface=0.0.0.0"

# Enable for ojdbc7 driver
CATALINA_OPTS="${CATALINA_OPTS} -Duser.timezone=Europe/MSK"

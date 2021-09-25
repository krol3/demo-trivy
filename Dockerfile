FROM jboss/base-jdk:8
ENV WILDFLY_VERSION 12.0.0.Final
ENV WILDFLY_SHA1 b2039cc4979c7e50a0b6ee0e5153d13d537d492f
ENV JBOSS_HOME /opt/jboss/wildfly
USER root
RUN cd $HOME \
 && curl -O https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz \
 && sha1sum wildfly-$WILDFLY_VERSION.tar.gz | grep $WILDFLY_SHA1 \
 && tar xf wildfly-$WILDFLY_VERSION.tar.gz \
 && mv $HOME/wildfly-$WILDFLY_VERSION $JBOSS_HOME \
 && rm wildfly-$WILDFLY_VERSION.tar.gz \
 && chown -R jboss:0 ${JBOSS_HOME} \
 && chmod -R g+rw ${JBOSS_HOME}
ENV LAUNCH_JBOSS_IN_BACKGROUND true
USER jboss
EXPOSE 8080
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]


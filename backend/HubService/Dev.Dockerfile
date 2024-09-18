FROM quay.io/wildfly/wildfly:33.0.2.Final-jdk21

RUN chown -R jboss:jboss /opt/jboss/wildfly/standalone/deployments/

COPY ./target/voice-chat.war /opt/jboss/wildfly/standalone/deployments/

# Expose ports for HTTP and debugging
EXPOSE 8080 5008

# Start WildFly in debug mode with hot-reload enabled
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "--debug", "*:5008"]
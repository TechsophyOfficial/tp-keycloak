FROM jboss/keycloak:11.0.2
COPY themes/augment /opt/jboss/keycloak/themes/awgment
RUN mkdir /opt/jboss/keycloak/standalone/deployments/providers
COPY standalone/deployments/providers/ /opt/jboss/keycloak/standalone/deployments/providers/
ADD config/standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml

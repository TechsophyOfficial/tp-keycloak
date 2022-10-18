FROM jboss/keycloak:11.0.2
COPY themes/awgment /opt/jboss/keycloak/themes/awgment
COPY themes/playground /opt/jboss/keycloak/themes/playground
RUN mkdir /opt/jboss/keycloak/standalone/deployments/providers
COPY standalone/deployments/providers/ /opt/jboss/keycloak/standalone/deployments/providers/
COPY imports/ /opt/jboss/keycloak/imports/
ADD config/standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml

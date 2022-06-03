FROM jboss/keycloak:11.0.2
COPY themes/augment /opt/jboss/keycloak/themes/augment
COPY themes/techsophy /opt/jboss/keycloak/themes/techsophy
COPY themes/rms /opt/jboss/keycloak/themes/rms
COPY themes/rms-mobile /opt/jboss/keycloak/themes/rms-mobile
RUN mkdir /opt/jboss/keycloak/standalone/deployments/providers
COPY standalone/deployments/providers/ /opt/jboss/keycloak/standalone/deployments/providers/
ADD config/standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml

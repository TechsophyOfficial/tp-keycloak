FROM jboss/keycloak:11.0.2
#COPY themes/awgment /opt/jboss/keycloak/themes/awgment
#COPY themes/ticketing /opt/jboss/keycloak/themes/ticketing
#COPY themes/playground /opt/jboss/keycloak/themes/playground
#COPY themes/mafkeycloak /opt/jboss/keycloak/themes/mafkeycloak
COPY themes/paisaplan /opt/jboss/keycloak/themes/paisaplan
COPY themes/cybersophy /opt/jboss/keycloak/themes/cybersophy
COPY themes/medunited /opt/jboss/keycloak/themes/medunited
RUN mkdir /opt/jboss/keycloak/standalone/deployments/providers
COPY standalone/deployments/ts_awgment_user_register_spi.jar /opt/jboss/keycloak/standalone/deployments/ts_awgment_user_register_spi.jar
COPY standalone/deployments/providers/ /opt/jboss/keycloak/standalone/deployments/providers/
COPY imports/ /opt/jboss/keycloak/imports/
ADD config/standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml

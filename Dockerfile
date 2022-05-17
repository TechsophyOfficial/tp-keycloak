FROM jboss/keycloak:11.0.2
COPY themes/augment /opt/jboss/keycloak/themes/augment
COPY themes/techsophy /opt/jboss/keycloak/themes/techsophy
RUN mkdir /opt/jboss/keycloak/standalone/deployments/providers
COPY standalone/deployments/providers/apple-social-identity-provider-1.0.2.jar /opt/jboss/keycloak/standalone/deployments/providers/apple-social-identity-provider-1.0.2.jar

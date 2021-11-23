FROM jboss/keycloak:11.0.2
COPY themes/augment /opt/jboss/keycloak/themes/augment
COPY themes/techsophy /opt/jboss/keycloak/themes/techsophy

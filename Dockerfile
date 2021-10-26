FROM jboss/keycloak:11.0.3

ENV DB_VENDOR=POSTGRES
ENV DB_ADDR=kesavan.db.elephantsql.com
ENV DB_DATABASE=wkgvrlqs
ENV DB_USER=wkgvrlqs
ENV DB_PASSWORD=Peeqlj10WJeLPbfjuv3cCt2Fzub2RuJc
ENV KEYCLOAK_USER=admin
ENV KEYCLOAK_PASSWORD=password
ENV PROXY_ADDRESS_FORWARDING=true
ENV TZ=UTC

COPY ./imports ./opt/jboss/keycloak/imports
COPY ./themes/quotes ./opt/jboss/keycloak/themes/quotes

EXPOSE 8080

ENTRYPOINT ["/opt/jboss/tools/docker-entrypoint.sh"]

CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/imports/realm-export.json"]
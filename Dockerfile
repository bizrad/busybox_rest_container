FROM containous/whoami:v1.5.0 as app
FROM busybox:1.36.0

COPY --from=app /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=app /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=app /whoami .

ENTRYPOINT ["/whoami"]
EXPOSE 80

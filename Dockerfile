FROM registry:2.6

COPY config.yml /
COPY run /

ENTRYPOINT [""]
CMD ["/run"]

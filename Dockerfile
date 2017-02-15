FROM registry:2.6

WORKDIR /tmp

COPY . /tmp

ENTRYPOINT [""]
CMD ["/tmp/run"]

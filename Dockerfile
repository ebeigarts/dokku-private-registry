FROM registry:2.6

WORKDIR /app

COPY . /app

ENTRYPOINT [""]
CMD ["/app/run"]

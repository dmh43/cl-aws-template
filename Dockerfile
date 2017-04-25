FROM debian:latest

WORKDIR /app
ADD . /app
ENTRYPOINT ["./main.sh"]

EXPOSE 80
ENV APP_ENV production

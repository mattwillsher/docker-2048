FROM alpine:3.12 as extract

RUN apk add git
RUN git clone --depth 1 https://github.com/gabrielecirulli/2048


FROM nginxinc/nginx-unprivileged:1.18

COPY --from=extract 2048 /usr/share/nginx/html/
COPY nginx_default.conf /etc/nginx/conf.d/default.conf

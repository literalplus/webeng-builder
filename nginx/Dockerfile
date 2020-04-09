FROM nginx:stable-alpine

VOLUME /usr/src/app

RUN ["/bin/mv", "/etc/nginx/nginx.conf", "/etc/nginx/nginx.conf.default"]

# rootless mode
RUN ["/bin/chmod", "-R", "g+rwx", "/var/cache/nginx"]
RUN ["/bin/chgrp", "-R", "root", "/var/cache/nginx"]
COPY nginx.conf /etc/nginx/nginx.conf

RUN ["/usr/sbin/addgroup", "nginx", "root"]
USER nginx
EXPOSE 8080

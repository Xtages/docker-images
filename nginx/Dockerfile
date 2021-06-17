FROM amazonlinux:2018.03

ARG NGINX_VER=1.18.0
ENV NGINX_VER=${NGINX_VER}

RUN yum install -y nginx-${NGINX_VER} gettext shadow-utils
RUN useradd xtages-nginx

COPY xtages.conf.template /etc/nginx/conf.d/xtages.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /

RUN touch /var/run/nginx.pid && \
    chown -R xtages-nginx:xtages-nginx /var/run/nginx.pid && \
    chown -R xtages-nginx:xtages-nginx /etc/nginx/conf.d/ && \
    chown -R xtages-nginx:xtages-nginx /var/log/nginx/ && \
    chown -R xtages-nginx:xtages-nginx /var/lib/nginx/ && \
    chown xtages-nginx:xtages-nginx /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 1800
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
USER xtages-nginx


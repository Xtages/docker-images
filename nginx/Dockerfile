FROM amazonlinux:2018.03

ARG NGINX_VER=1.18.0
ENV NGINX_VER=${NGINX_VER}

RUN yum install -y nginx-${NGINX_VER} gettext

COPY xtages.conf.template /etc/nginx/conf.d/xtages.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 1800
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]


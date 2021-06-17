#FROM amazonlinux:2018.03
FROM nginx:1.21.0-alpine

#ARG NGINX_VER=1.18.0
#ENV NGINX_VER=${NGINX_VER}
#
#RUN yum install -y nginx-${NGINX_VER} gettext
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
EXPOSE 1800
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]


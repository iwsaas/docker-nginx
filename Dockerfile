FROM iwsaas/centos:7.1
MAINTAINER Henry Huang <henry.s.huang@gmail.com>

# Install the Nginx.org CentOS repo.
ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Install base stuff.
RUN yum -y install ca-certificates; yum clean all
RUN yum -y update; yum clean all
RUN yum -y install nginx; yum clean all

# forward request logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]

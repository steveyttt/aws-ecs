FROM centos:7
RUN yum -y install squid && \
    yum -y upgrade && \
    yum -y clean all
EXPOSE 3128
CMD /usr/sbin/squid -NYCd 1
FROM ubuntu:14.04.2

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-get update \
    && apt-get install -y --force-yes --no-install-recommends \
        curl \
        supervisor \
        openbox \
        default-jre \
        net-tools \
        x11vnc \
        xvfb \
        xdotool \
        x11-apps \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

#RUN cd / \
#    && curl ftp.supermicro.com/utility/IPMIView/Linux/$( \
#       curl -l ftp.supermicro.com/utility/IPMIView/Linux/ | grep '^IPMIView.*x64.*.tar.gz$' \
#    ) | tar -zxvf - \
#    && mv /IPMIView* IPMIView
# ftp://ftp.supermicro.com/CDR-X9_1.30_for_Intel_X9_platform/IPMI/IPMIView/Jar/IPMIView_2.9.30_jar_20140317.zip

ADD IPMIView.tar.gz /
ADD supervisord.conf /etc/supervisor/conf.d/
ADD startup.sh /

EXPOSE 5900
WORKDIR /root


FROM debian:latest
MAINTAINER Pierre Cheynier <pierre.cheynier@sfr.com>

RUN apt-get update && apt-get install -y quagga sed && rm -rf /var/lib/apt/lists/*
RUN sed -i -e 's/bgpd=no/bgpd=yes/' /etc/quagga/daemons
RUN sed -i -e 's/zebra=no/zebra=yes/' /etc/quagga/daemons

COPY bgpd.conf /etc/quagga/bgpd.conf 

EXPOSE 2605 179

CMD ["/usr/lib/quagga/bgpd"]
CMD ["/usr/lib/quagga/zebra"]

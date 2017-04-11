FROM ubuntu:16.04
RUN apt-get update && apt-get -y upgrade && apt-get install -y wget
COPY bitcoin-0.14.0-x86_64-linux-gnu.tar.gz /tmp/
RUN cd /tmp && mkdir -p /data/ && mkdir -p /opt/bitcoin && wget -c https://bitcoin.org/bin/bitcoin-core-0.14.0/bitcoin-0.14.0-x86_64-linux-gnu.tar.gz 
RUN tar xvzf /tmp/bitcoin-0.14.0-x86_64-linux-gnu.tar.gz -C /opt/bitcoin/ && mv /opt/bitcoin/bitcoin-0.14.0/* /opt/bitcoin/

VOLUME /data
EXPOSE 8333 18333 8332 18332
ENTRYPOINT /opt/bitcoin/bin/bitcoind

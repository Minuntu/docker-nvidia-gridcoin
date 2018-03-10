FROM nvidia/cuda:9.0-runtime

# Default config :
ENV BOINC_EMAIL gregory@siwhine.net
ENV GRC_RPC_USERNAME gridcoin
ENV GRC_RPC_PASSWORD changeme

# Account manager :
ENV BAM_URL https://grcpool.com/
ENV BAM_USERNAME user
ENV BAM_PASSWORD password

# Install software :
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:gridcoin/gridcoin-stable && \
    apt-get update && \
    apt-get install -y gridcoinresearchd boinc-client supervisor && \
    apt-get clean  && rm -Rf /var/lib/apt/lists

# Prepare data dir :
RUN mkdir /data

# Install supervisor config :
ADD supervisor.conf /etc/supervisor/conf.d/gridcoin.conf

# Add config and startup scripts :
ADD scripts /scripts

CMD /scripts/boot.sh

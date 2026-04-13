FROM mono:6.12

WORKDIR /src/AirSIEM

RUN apt-get update && apt-get install -y \
    git \
    nuget \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY docker/airsiem-connector.sh /airsiem-connector.sh
RUN chmod +x /airsiem-connector.sh

CMD ["/airsiem-connector.sh"]
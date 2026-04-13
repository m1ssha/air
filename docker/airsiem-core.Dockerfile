FROM mono:6.12

WORKDIR /src/AirSIEM

RUN apt-get update && apt-get install -y \
    git \
    nuget \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY docker/airsiem-core.sh /airsiem-core.sh
RUN chmod +x /airsiem-core.sh

CMD ["/airsiem-core.sh"]
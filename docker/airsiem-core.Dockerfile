FROM mono:6.12-slim

WORKDIR /src/AirSIEM

RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list \
 && sed -i 's|http://deb.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list || true \
 && printf 'Acquire::Check-Valid-Until "false";\nAcquire::AllowInsecureRepositories "true";\n' > /etc/apt/apt.conf.d/99archive \
 && apt-get update \
 && apt-get install -y --no-install-recommends git nuget wget ca-certificates \
 && rm -rf /var/lib/apt/lists/*

COPY docker/airsiem-core.sh /airsiem-core.sh
RUN chmod +x /airsiem-core.sh

CMD ["/airsiem-core.sh"]
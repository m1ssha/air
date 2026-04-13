#!/usr/bin/env bash
set -e

cd /src/AirSIEM/ApacheConnector

nuget restore ApacheConnector.sln || true
xbuild /p:Configuration=Release ApacheConnector.sln

APP_DIR="/src/AirSIEM/ApacheConnector/ApacheConnector/bin/Release"
CONFIG_FILE="$APP_DIR/ApacheConnector.exe.config"

cat > "$CONFIG_FILE" <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <appSettings>
    <add key="RabbitMqHost" value="${RMQ_HOST}" />
    <add key="RabbitMqPort" value="${RMQ_PORT}" />
    <add key="RabbitMqUser" value="${RMQ_USER}" />
    <add key="RabbitMqPassword" value="${RMQ_PASS}" />
    <add key="QueueName" value="AirSIEM_ConnectorQueue" />
    <add key="AccessLogPath" value="${ACCESS_LOG}" />
    <add key="ReadIntervalMs" value="1000" />
  </appSettings>
</configuration>
EOF

touch "${ACCESS_LOG}"

cd "$APP_DIR"
mono ApacheConnector.exe
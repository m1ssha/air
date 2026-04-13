#!/usr/bin/env bash
set -e

cd /src/AirSIEM/AirSIEM

nuget restore AirSIEM.sln || true
xbuild /p:Configuration=Release AirSIEM.sln

APP_DIR="/src/AirSIEM/AirSIEM/AirSIEM/bin/Release"

mkdir -p "$APP_DIR/Rules"
cp -f /opt/airsiem/rules/* "$APP_DIR/Rules/" || true

CONFIG_FILE="$APP_DIR/AirSIEM.exe.config"

cat > "$CONFIG_FILE" <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <appSettings>
    <add key="RulesPath" value="$APP_DIR/Rules" />
    <add key="RabbitMqHost" value="${RMQ_HOST}" />
    <add key="RabbitMqPort" value="${RMQ_PORT}" />
    <add key="RabbitMqUser" value="${RMQ_USER}" />
    <add key="RabbitMqPassword" value="${RMQ_PASS}" />
    <add key="MongoHost" value="${MONGO_HOST}" />
    <add key="MongoPort" value="${MONGO_PORT}" />
    <add key="MongoDatabase" value="AirSIEM" />
    <add key="MongoAlertsCollection" value="alerts" />
    <add key="QueueName" value="AirSIEM_ConnectorQueue" />
  </appSettings>
</configuration>
EOF

cd "$APP_DIR"
mono AirSIEM.exe
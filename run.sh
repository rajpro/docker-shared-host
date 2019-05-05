#!/bin/sh

SENTORA_INSTALLER_VERSION="master"
SENTORA_CORE_VERSION="1.0.1"

PANEL_PATH="/etc/sentora"
PANEL_DATA="/home"
PANEL_CONF="$PANEL_PATH/configs"

if [ -f /etc/sentora/panel/index.php ]; then
    break;
else
    apk add mysql-client
    mkdir -p /etc/sentora/panel && mkdir -p /etc/sentora/configs
    wget -nv -O sentora_core.zip https://github.com/sentora/sentora-core/archive/$SENTORA_CORE_VERSION.zip
    chown -R root:root $PANEL_PATH
    unzip -oq sentora_core.zip -d $PANEL_PATH
    /bin/cp -rf $PANEL_PATH/sentora-core-$SENTORA_CORE_VERSION/* $PANEL_PATH/panel/
    rm sentora_core.zip
    wget -nv -O sentora_preconfig.zip https://github.com/sentora/sentora-installers/archive/$SENTORA_INSTALLER_VERSION.zip
    unzip -oq sentora_preconfig.zip
    /bin/cp -rf sentora-installers-$SENTORA_INSTALLER_VERSION/preconf/* $PANEL_CONF
    rm sentora_preconfig*
    rm -rf sentora-*
    rm -rf /etc/sentora/sentora-*
    
fi
#!/bin/sh

# Modify these to provide tools locations
VPN_TOOL=/usr/local/bin/openfortivpn
VPN_LOGIN=/opt/openfortivpn-webview/openfortivpn-webview

# Modify these to provide appropriate URL & realm
FORTIVPN_URL={url:port}
FORTIVPN_REALM=foo

LOG_FILE=/tmp/fortivpn.log
TMP_FILE=$(mktemp)

start() {
    VPNCOOKIE=$(${VPN_LOGIN} ${FORTIVPN_URL} --realm=${FORTIVPN_REALM}) 2> /dev/null
    echo ${VPNCOOKIE} | sudo ${VPN_TOOL} ${FORTIVPN_URL} --realm=${FORTIVPN_REALM} --cookie-on-stdin > ${LOG_FILE} 2>&1 &
    sudo echo "VPN (${FORTIVPN_URL}) started."
}

stop() {
    sudo ps -aef | grep ${VPN_TOOL} > /dev/null 2>&1
    sudo kill -SIGINT $(pidof ${VPN_TOOL}) > /dev/null 2>&1
    sudo echo "VPN (${FORTIVPN_URL}) stopped."
}

case "$1" in
    start|up)
        start
        ;;
    stop|down)
        stop
        ;;
    restart)
        stop
        start
        ;;
    *)
    echo $"Usage: $0 {start|up|stop|down|restart}"
    exit 1
esac

exit 0

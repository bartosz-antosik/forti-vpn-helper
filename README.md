# Fortigate VPN with SASL SSO helper script

A helper script to integrate start/stop of Fortigate VPN with SAML single sign-on.

## Prerequisites

These two binaries, compiled for appropriate platform, are required to use the script:

[openfortivpn](https://github.com/adrienverge/openfortivpn) version 18.0 or newer.

[openfortivpn-webview](https://github.com/gm-vm/openfortivpn-webview) version 1.0.1 or newer.

## Configuration

These variables, located inside the `fortivpn.sh` script, have to be set to provide locations of the binary utilities used by the script:

```shell
VPN_TOOL=/usr/local/bin/openfortivpn
VPN_LOGIN=/opt/openfortivpn-webview/openfortivpn-webview
```

Another two variables have to be set to provide appropriate URL and realm for the VPN that the script is going to be used with:

```shell
FORTIVPNURL={host:port}
FORTIVPNREALM={realm}
```

## Usage

To start the VPN connection:

```shell
fortivpn up
```

To finish the VPN connection:

```shell
fortivpn down
```

## ToDo

- [ ] Better error handling (parsing output of background task)
- [ ] Multiple or configurable URL to login to
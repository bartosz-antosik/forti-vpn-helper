# Fortigate VPN with SAML SSO helper script

A helper script to integrate start/stop of Fortigate VPN with SAML single sign-on.

## Prerequisites

These two binaries, compiled for appropriate platform, are required to use the script:

[openfortivpn](https://github.com/adrienverge/openfortivpn) version 1.18 or newer (`--cookie` option is required).

[openfortivpn-webview](https://github.com/gm-vm/openfortivpn-webview) version 1.0.1 or newer, or [fortitude-webview](https://github.com/PolyMeilex/fortitude-webview) which works under WSL2.

## Configuration

These variables, located inside the `forti-vpn` script, have to be set to provide locations of the binary utilities used by the script:

```shell
VPN_LOGIN=/opt/openfortivpn-webview/openfortivpn-webview
VPN_TOOL=/usr/local/bin/openfortivpn
```

Another three variables have to be set to provide appropriate URL, realm and routes for the VPN that the script is going to be used with. These can also be set in the configuration file `forti-vpn.conf` located (by default) in `/etc` directory:

```shell
FORTIVPN_URL={vpn.host:port}
FORTIVPN_REALM={realm}
FORTIVPN_ROUTES="123.0.0.4/16 123.0.0.5/16"
```

if `FORTIVPN_ROUTES` is left empty no routes are established by the script and default routes provisioned by the connection server are used.

## Usage

To start the VPN connection:

```shell
forti-vpn up
```

To finish the VPN connection:

```shell
forti-vpn down
```

To check status of the VPN connection:

```shell
forti-vpn status
```

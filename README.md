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

Another three variables have to be set to provide appropriate URL, realm and routes for the VPN that the script is going to be used with. They can also be set in the configuration file (default is `/etc/forti-vpn.conf`):

```shell
FORTIVPN_URL={vpn.host:port}
FORTIVPN_REALM={realm}
FORTIVPN_USER={user}
FORTIVPN_PASSWORD={password}
FORTIVPN_ROUTES="123.0.0.4/16 123.0.0.5/16"
```

There can be multiple configuration files, they are selected by providing a name suffix as the last parameter to the script call, for example:

`/etc/forti-vpn-vpn1.conf`
`/etc/forti-vpn-vpn2.conf`

The defult file can be e symbolic link to one of the configurations provided:

`ln -s /etc/forti-vpn-vpn1.conf /etc/forti-vpn.conf`

if `FORTIVPN_USER` and `FORTIVPN_PASSWORD` are provided SAML token discovery is omitted and the provided credentials are used to initialize the tunnel.

if `FORTIVPN_ROUTES` is left empty no routes are established by the script and default routes provisioned by the connection server are used.

## Usage

To start the VPN connection:

```shell
forti-vpn up
```

To start the VPN connection for non default configuration:

```shell
forti-vpn up vpn2
```

To finish the VPN connection:

```shell
forti-vpn down
```

To check status of the VPN connection:

```shell
forti-vpn status
```

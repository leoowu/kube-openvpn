#!/bin/bash


docker run --user=$(id -u) -v $PWD:/etc/openvpn:z -ti harbor.ucex.corp/library/openvpn easyrsa build-client-full $1 nopass
sleep 3
docker run --user=$(id -u) -e OVPN_SERVER_URL=tcp://openvpn.ucexwan.corp:31194 -v $PWD:/etc/openvpn:z --rm harbor.ucex.corp/library/openvpn  ovpn_getclient $1 > ${1}.ovpn

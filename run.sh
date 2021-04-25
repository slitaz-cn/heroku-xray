#!/bin/sh

cat << EOF > /etc/xray/config.json
{
	"inbounds": [{
		"port": $PORT,
		"listen": "0.0.0.0",
		"protocol": "vless",
		"settings": {
			"clients": [{
				"id": "$UUID"
			}],
			"decryption": "none"
		},
		"streamSettings": {
			"network": "ws",
			"wsSettings": {
				"path": "$WSPATH"
			}
		}
	}],
	"outbounds": [{
		"protocol": "freedom"
	}]
}
EOF

/usr/bin/xray run --config=/etc/xray/config.json
#!/bin/sh

cat << EOF > /etc/config.json
{
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "$UUID",
                        "level": 0
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws"
            }
        }
    ],
	"outbounds": [{
		"protocol": "freedom"
	}]
}
EOF

/usr/bin/xray run --config=/etc/config.json

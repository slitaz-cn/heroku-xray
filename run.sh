#!/bin/sh

cat << EOF > /etc/xray/config.json
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
                "network": "ws",
                "security": "none"
            }
        }
    ],
	"outbounds": [{
		"protocol": "freedom"
	}]
}
EOF

/usr/bin/xray run --config=/etc/xray/config.json

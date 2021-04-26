[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://dashboard.heroku.com/new?template=https://github.com/slitaz-cn/heroku-xray)

## 这是一个heroku的自动生成xray服务器

请 Fork 本项目到自己的账户下。 Actions 需要以下 Secrets 才能正常工作，这些 Secrets 会被 workflow 中的 [akhileshns/heroku-deploy](https://github.com/AkhileshNS/heroku-deploy) 使用。

具体实现细节，请查看 [workflow 配置文件](./.github/workflows/main.yml).

| Name              | Description                                |
| ----------------- | ------------------------------------------ |
| APP_NAME          | 就是你 heroku 项目的名字                   |
| EMAIL             | heroku 账户的 email                        |
| HEROKU_API_KEY    | heroku API key， 在 account 设置下可以找到 |
| HEROKU_XRAY_UUID  | xrayUUID                                  |

> 请务必生成新的 UUID。使用已有的 UUID 会使自己 V2ray 暴露在危险之下。

## VLESS websocket 客户端配置

### JSON

```json
"outbounds": [
        {
            "protocol": "vless",
            "settings": {
                "vnext": [
                    {
                        "address": "***.herokuapp.com", // heroku app URL 或者 cloudflare worker url/ip
                        "port": 443,
                        "users": [
                            {
                                "id": "", // 填写你的 UUID
                                "encryption": "none"
                            }
                        ]
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "tls",
                "tlsSettings": {
                    "serverName": "***.herokuapp.com" // heroku app host 或者 cloudflare worker host
                }
              }
          }
    ]
```

别忘记开启 TLS。

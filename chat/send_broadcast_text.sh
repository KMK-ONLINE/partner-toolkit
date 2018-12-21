#!/bin/bash
# Chat API
#  Sending broadcast text
# please ensure you have the access token with scope bot, bot.notify.all and bot.notify
echo 'This will send broadcast text to all subscribers'
echo 'Please enter Access Token\n'
read token
echo 'Please enter BbmId\n'
read bbmId

curl -v  -H "Content-Type:application/json; charset=utf-8" -H "Accept: application/json" -H "Authorization: bearer $token" \
-d '{"from":"'$bbmId'",
"message":
    {
      "type": "text",
      "text": "Hello, this is broadcast text test."
    }
  }', \
  "https://chat.bbmessaging.com/v1/notification"
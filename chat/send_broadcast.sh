#!/bin/bash
# Chat API
#  Sending broadcast
# ./send_broadcast.sh 
# please ensure you have the access token with scope: bot, bot.notify.all and bot.notify
# the bbmId is the chat bot bbm id, it can be extracted from JSON response when you acquire access token
echo 'This will send broadcast message to all subscribers'
echo 'Please enter Access Token\n'
read token
echo 'Please enter BbmId\n'
read bbmId

curl -v  -H "Content-Type:application/json; charset=utf-8" -H "Accept: application/json" -H "Authorization: bearer $token"  \
-d '{"from":"'$bbmId'",
"message":
    {
      "type": "text",
      "text": "Hello from broadcast"
    }
  }', \
  "https://chat.bbmessaging.com/v1/notification"

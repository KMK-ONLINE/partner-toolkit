#!/bin/bash


echo Enter token (starting from bearer ...)
read bearer
echo Enter Channel ID
read channelId
echo Enter Chat ID
read chatId
echo Enter sender ID(from)
read from
echo Enter recipent ID (to)
read to
echo Enter Message
read message
echo Enter mTok
read mTok

curl -v \
-H "Content-Type: application/json" \
-H "Authorization: ${bearer}" \
-d '{"mType":"bot","chId":"${channelId}","chatId":"${chatId}","from":"${from}","to":"${to}",
"messages": [
    {
      "type": "text",
      "text": "${message}"
    }
  ],
"userInfos":{${from} :{"name":"Demo Bot"}}} ' \
https://chat.bbmessaging.com/v1/chats/${chatId}?mTok=${mTok}

#!/bin/bash


echo Enter token (starting from bearer ...)
read bearer
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
-d '{"mType":"bot","chId":"C00132297","chatId":"${chatId}","from":"${from}","to":"${to}",
"messages": [
    {
      "type": "text",
      "text": "${message}"
    }
  ],
"userInfos":{"3175533613684883456":{"name":"Demo Bot"}}} ' \
https://chat-beta.bbm.blackberry.com/v1/chats/${chatId}?mTok=${mTok}
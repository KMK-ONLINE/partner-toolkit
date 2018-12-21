#!/bin/bash
# Chat API
#  Sending channel regular post
# ./send_broadcast.sh <access-token>
# please ensure you have the access token with scope bot, bot.notify.all and bot.notify
echo 'This will send channel regular post'
echo 'Please enter Access Token\n'
read token

curl -v  -H "Content-Type:application/json; charset=utf-8" \
 -H "Accept: application/json" \
 -H "Authorization: bearer $token"  \
-d '{"description":"This is channel regular post test", "title":"Group War", "imageUrl": "https://bbmtek.files.wordpres$
"https://api.bbmessaging.com/v2/channels/C012A6C90/posts"
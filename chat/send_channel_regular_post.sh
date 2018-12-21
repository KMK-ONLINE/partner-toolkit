#!/bin/bash
# Chat API
#  Sending channel regular post
# ./send_broadcast.sh <access-token>
# please ensure you have the access token with scope bot, bot.notify.all and bot.notify
echo 'This will send channel regular post'
echo 'Please enter Access Token\n'
read token
echo 'Please enter ChannelID\n'
read channelId

curl -v  -H "Content-Type:application/json; charset=utf-8" \
 -H "Accept: application/json" \
 -H "Authorization: bearer $token"  \
-d '{"description":"This is channel regular post test", "title":"Group War", "imageUrl": "https://bbmtek.files.wordpress.com/2018/12/01-Grup_War-900x900pxl-1.png?w=666"}', \
"https://api.bbmessaging.com/v2/channels/$channelId/posts"
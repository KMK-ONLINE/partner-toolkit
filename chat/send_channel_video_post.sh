#!/bin/bash
# Chat API
#  Sending channel video post
# please ensure you have the access token with scope bot, bot.notify.all and bot.notify
echo 'This will send channel video post'
echo 'Please enter Access Token\n'
read token
echo 'Please enter ChannelID\n'
read channelId

curl -v  -H "Content-Type:application/json; charset=utf-8" \
 -H "Accept: application/json" \
 -H "Authorization: bearer $token"  \
-d '{"videoUrl": "https://www.vidio.com/watch/1523206-hot-news-komentar-keras-gisel-atas-hastag-save-gempi"}', \
"https://api.bbmessaging.com/v2/channels/$channelId/posts"

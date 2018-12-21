#!/bin/bash
# Chat API
#  Sending broadcast video
# please ensure you have the access token with scope bot, bot.notify.all and bot.notify
echo 'This will send broadcast video to all subscribers'
echo 'Please enter Access Token\n'
read token
echo 'Please enter bbmId\n'
read bbmId

curl -v  -H "Content-Type:application/json; charset=utf-8" -H "Accept: application/json" -H "Authorization: bearer $token" \
-d '{"from":"'$bbmId'",
"message":
    {
      "type": "Link",
        "link": {
      "label": "https://www.vidio.com/watch/1257896",
      "url":"https://www.vidio.com/watch/1257896",
      "siteName":"Video",
      "description":"This is broadcast video test",
      "image":"https://cdn0-a.production.vidio.static6.com/uploads/video/image/1257896/wide-pemenang-grammy-3127aa.jpg"
        }
     }
  }', \
  "https://chat.bbmessaging.com/v1/notification"
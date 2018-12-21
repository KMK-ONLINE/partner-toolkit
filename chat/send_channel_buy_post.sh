#!/bin/bash
# Chat API
#  Sending channel buy post
# please ensure you have the access token with scope bot, bot.notify.all and bot.notify
echo 'This will send channel buy now post'
echo 'Please enter Access Token\n'
read token

curl -v  -H "Content-Type:application/json; charset=utf-8" \
 -H "Accept: application/json" \
 -H "Authorization: bearer $token"  \
-d '{
      "title": "Buy Now Post",
      "description":"This is channel buy now post test.",
      "imageUrl": "http://cdn2.tstatic.net/makassar/foto/bank/images/pesawat-udara-jenis-airbus-a330-200-milik-garuda$
      "ctaButtonName":"Buy Now",
      "ctaUrl":"https://bbm.com"
   }', \
"https://api.bbmessaging.com/v2/channels/C012A6C90/posts"
#!/bin/bash
# Chat API
#  Sending broadcast image
# please ensure you have the access token with scope bot, bot.notify.all and bot.notify
echo 'This will send broadcast image to all subscribers'
echo 'Please enter Access Token\n'
read token
echo 'Please enter bbmID\n'
read bbmId
echo 'Pease enter channelId\n'
read channelId

curl -v  -H "Content-Type:application/json; charset=utf-8" -H "Accept: application/json" -H \
 "Authorization: bearer $token"  \
-d '{"from":"'$bbmId'","chId":"'$channelId'",
"message":
    {
      "type": "buttons",
        "buttons": {
        "actions":[ {   "type":"link",
                        "link": { "label":"Test","url":"https://www.vidio.com/watch/1257896"}
                }
                ],
      "title":"demobbm.com",
      "desc":"This is broadcast image test",
      "imageUrl":"https://d2x3rgjr0n9rv4.cloudfront.net/2017/02/29121834/broadcast_from_max_featured-354x214.jpg"
        }
     }
  }', \
  "https://chat.bbmessaging.com/v1/notification"
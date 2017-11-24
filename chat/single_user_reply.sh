#/bin/bash
# Chat API
# Send a new message to a User
# ./exchange-token.sh <client-id> <client-secreet> <access-token>
# mTok can be acquired from running "pm2 log"
#Sender and Reciever BBMID can be aquired from "pm2 log""
echo 'This will send a message to a single user'
echo 'Please Enter Access Token (bearer)\n'
read accessToken
echo 'Please enter Chat Id\n'
read ChatId
echo 'Please enter mTok\n'
read mTok
echo 'Please enter Channel Id\n'
read channelId
echo 'Please enter BBM Id of From(Sender)\n'
read fromBBMId
echo 'Please enter BBM Id of To(Reciever)\n'
read toBBMId
echo 'Enter the message\n'
read message
echo 'Enter the username(Sender)\n'
read senderName
curl -v \
-H "Content-Type: application/json" \
-H "Authorization: $accessToken" \
-d '{"mType":"bot","chId":$channelId,"chatId":$chatId,"from":$fromBBMId,"to":$toBBMId,
"messages": [
    {
      "type": "text",
      "text": $message
    }
  ],
"userInfos":{$fromBBMId:{"name":$senderName}}} ' \
https://chat-beta.bbm.blackberry.com/v1/chats/$chatId?mTok=$mTok


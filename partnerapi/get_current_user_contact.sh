#!/bin/bash

# Partner API
# Get Current User Profile

# Access token could be acquired from running pm2 log
echo 'This will return bbid of current user contact.'
echo 'Please enter your Access Token (bearer abcdefghijklmnopqrstuvwxyz)'
read accessToken

curl -v -H "Authorization:$accessToken" 'https://api-beta.bbm.blackberry.com:8443/v2/user/contacts'

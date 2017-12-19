#!/bin/bash

printf 'Partner API\n'
printf 'Exchange token from short lived token to long lived token\n'
# ./exchange-token.sh <client-id> <client-secreet> <access-token>
# Access token could be acquired from running pm2 log
printf 'BASE64 is encoded code from "oauthUsername:oauthPassword" that could be acquired from .env file\n'

printf 'Please enter clientId/oauthUsername\n'
read clientID
printf 'Please enter clientSecreet/oauthPassword\n'
read clientSecreet
combined=$clientID:$clientSecreet
baseEncoded64=`printf $combined | base64 | tr -d '[:space:]'`
echo $combined
echo 'Please enter Short-l token'
read slToken
echo 'below is your base64'
echo $baseEncoded64
echo 'Please enter path to your Private Key file (.key)'
# echo 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.key'
read key
echo 'Please enter path to your Cert file (.crt)'
# echo 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.crt'
read crt
echo 'Enter URL'
echo 'Example https://auth-str.eval.blackberry.com:8443'
read URL
# https://auth-beta.bbm.blackberry.com:8443
# https://auth-str.eval.blackberry.com:8443
# https://auth2.bbm.blackberry.com

curl -v --cert $crt --key $key -H "Content-Type:application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: Basic $baseEncoded64" -d "grant_type=exchange_token&access_token=$slToken" "$URL/oauth/token"

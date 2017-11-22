#!/bin/bash

echo 'Partner API\n'
echo 'Refresh token\n'
# ./exchange-token.sh <client-id> <client-secreet> <access-token>
echo 'Access token could be acquired from running pm2 log\n'
echo 'BASE64 is encoded code from "oauthUsername:oauthPassword" that could be acquired from .env file in the server\n'

echo 'This will exhchange short-lived token to long-lived token.\n'
echo 'Please enter clientId/oauthUsername'
read clientID
echo 'Please enter clientSecreet/oauthPassword'
read clientSecreet
# translate to base64
combined=$clientID:$clientSecreet
baseEncoded64=`printf $combined | base64 | tr -d '[:space:]'`
echo 'below is your base64'
echo $baseEncoded64

echo 'Please enter refresh_token that\n'
echo 'Acquired from exchange_token.sh'
read refreshToken
echo 'Please enter path to your Private Key file (.key)\n'
echo 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.key'
read key
echo 'Please enter path to your Cert file (.crt)\n'
echo 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.crt'
read crt

curl -v --cert $crt --key $key -H "Content-Type:application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: Basic $baseEncoded64" -d "grant_type=refresh_token&refresh_token=$refreshToken" "https://auth-beta.bbm.blackberry.com:8443/oauth/token"

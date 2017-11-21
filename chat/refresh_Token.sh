#!/bin/bash

# Partner API
# Refresh Token
# ./exchange-token.sh <client-id> <client-secreet> <access-token>
# Refresh Token could be acquired from running pm2 log
# BASE64 is encoded code from "oauthUsername:oauthPassword" that could be acquired from .env file

echo This will exhchange short-lived token to long-lived token.
echo 'Please enter Client ID'
read clientID
echo 'Please enter Client Secreet'
read clientSecreet
combined=$clientID:$clientSecreet
baseEncoded64=`printf $combined | base64 | tr -d '[:space:]'`
echo $combined
echo 'Please enter refresh_token acquired in previous token request'
read refreshToken
echo 'below is your base64'
echo $baseEncoded64
echo 'Please enter path to your Private Key file (.key)'
echo 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.key'
read key
echo 'Please enter path to your Cert file (.crt)'
echo 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.crt'
read crt

curl -v --cert $crt --key $key -H "Content-Type:application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: Basic $baseEncoded64" -d "grant_type=refresh_token&refreshToken=$refreshToken&scope=v1" "https://auth-beta.bbm.blackberry.com:8443/oauth/token"
#!/bin/bash

# Partner API
# Exchange token from short to long live token
# ./excchange-token.sh <client-id> <client-secreet> <access-token>
# Access token could be acquired from running pm2 log
ACCESS_TOKEN="eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIiwia2lkIjoiYmJtdHNfZW5jX2tleV9iZXRhIiwiY3R5IjoiSldUIn0..GzfsVHagPXqk52Ta.4ps5gZvJjhEurCLPWLFkgpg-7HVABTYiOIPLkl0J8mehhB171rRKBbsGBXr3EWfKjkh6b0c50F9oaJZ1P06sblpipIN3fhlUpMS96r92Vo6bfOV1Cdc52yaNcE7YOHKhnCygSoEisTaTZBGkrAG2acNjtkw9ppZ9uKMc9TvEPWIh9dJ9C8z4I9MHRkbaKTEJkyGo3oRAyo-bdiVbtHShgSNCQ8QNKSG9kL4pczO4leZuf8ZlIJFpHgdv80M6CCYql6gJxS4YL3ro7sG0iN3X95vNuYFMg1N6G5wB9qCPg4rpR9lqUNn1iSqVECwIAPfocc307LKM1cHJH-6ipff4ejBzMfQQVmO97VSpu4oRoSDJ8aEfImBYcsI8q4rf6McXegWI_i13E1Pv38_WfuPZXdPZ5MCQ7QyAwkGNT8mZjriZMD6LwS3YFfTvaQ.0q9vLWir02p1Np1IxXJaiA"

# BASE64 is encoded code from "oauthUsername:oauthPassword" that could be acquired from .env file
BASE64="WDZEMjRUaEtZYzBwRHFlNGtFOjFqVnc1Y0wwc1NOenFxeG9OZkxHV3E0UUVnNmxoYWhQZ0IzU3hWMG9WQnBX"

#

echo This will exhchange short-lived token to long-lived token.


echo Please enter Client ID
read clientID
echo Please enter Client Secreet
read clientSecret
echo Please enter Short-Leved token
read slToken
echo Please enter path to your Private Key file (.key)
read key
echo Please enter path to your Cert file (.crt)
read crt

curl -v --cert /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.crt --key /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.key -H "Content-Type:application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: Basic $BASE64" -d "grant_type=exchange_token&access_token=$ACCESS_TOKEN" "https://auth-beta.bbm.blackberry.com:8443/oauth/token"

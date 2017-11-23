# I assume you've already clone this git
These scripts work on bash
I never test on another env

# Important !
  You may refer to this Docs http://demobbm.com/docs/partnerapi.html
    Enter the shell
    Get your token by running "pm2 log" on server in root.
    Get your phone and access "demo" from "discover" and then touch the button "send short live token.."
    Get the token from "pm2 log" command running
    Firstly you need to exchange the short lived token to long lived token as command below

      1. Add execute permission to make it excutable by "sudo chmod +x exchange-token.sh"
      2. Run the script by "./exchange-token.sh"
      3. Follow the echo message instruction
      4. run step 1-3 to another shell script (.sh) just change the path of script

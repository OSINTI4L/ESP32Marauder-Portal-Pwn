<div align="center">
  
# Spam Flipper Zero Evil Portals
![flipperburpview](https://github.com/user-attachments/assets/393e9802-dcd5-4402-837b-47d733a71508)
</div>

In this guide we will be spamming Flipper Zero evil portals using [Burpsuite](https://www.kali.org/tools/burpsuite/) in [Kali Linux.](https://www.kali.org/)

1. Burpsuite is a tool used for web application penetration testing. It works by allowing the user to intercept and manipulate web traffic occuring between the internet browser and the server in the form of things such as http GET requests. In order for us to use this tool we will first need to setup a proxy. The easiest method to do this is by using the Firefox extension [FoxyProxy.](https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/)

After adding the extension to the browser, select it and go to the "Proxies" tab and create a new proxy with the following selections,

![proxysettings](https://github.com/user-attachments/assets/a4e86e42-5004-448e-b8be-9e8c257fa15d)

Once this is completed, save and close out of the proxy settings.

2. Connect your machine to the evil portal.

3. Launch Burpsuite by using the command ```burpsuite``` in terminal or by searching for burpsuite in the tools menu and then proceed through the start up prompts.

4. Navigate to the evil portal login prompt in your browser and then enable your proxy in the foxyproxy extension by selecting it.

![proxy](https://github.com/user-attachments/assets/7f2fa6cb-7693-4527-8231-fcce088648ba)

5. Once you have Burpsuite open and your proxy enabled, navigate to the "Proxy" tab in Burpsuite and turn "Intercept On" by selecting it.

6. Navigate back to the evil portal login prompt and enter "username" and "password" into the respective username and password fields and select login.

![portalshow](https://github.com/user-attachments/assets/9897d3f4-43cd-4871-9f09-c2276b07ccfd)

7. Navigate back to Burpsuite and you will notice that your http GET request has been captured, this is the raw data request of your attempt to login.

8. Right click in the data field of the http GET request and select "Send to Intruder", once complete, turn "Intercept Off" by selecting it.

![bs1](https://github.com/user-attachments/assets/811edcb5-46e6-4064-8d1f-93c4c37981ec)

9. Navigate to the Intruder tab where you will see your http GET request. Select "Auto" (on the far right), which will highlight the username and password fields. This will tell Burpsuite which areas of the http GET request to spray.

![bs2](https://github.com/user-attachments/assets/ec1f5c3f-bde6-450c-9988-ee67e530ba01)

10. Select "Cluster Bomb" for the Attack type and then select the Paylods tab directly above "Choose an attack type".

11. Here we will need a wordlist to load into Burpsuite to spray at the evil portal. I chose to use my own, but any wordlist will work. Select "Payload set: 1" and Payload type: Simple list". In the "Payload settings [Simple List]" area type "PORTAL PWN" into the text bar next to "Add", and then add it by selecting "Add".

![bs3](https://github.com/user-attachments/assets/1f0a4ef9-9f55-4a4f-8972-ecafbfec2ce4)

Select "Payload set: 2" and "Payload type: Simple list". In the "Payload settings [Simple List]" area select "Load" and select your wordlist of choice.

![bs4](https://github.com/user-attachments/assets/19ab1ed5-b05c-4322-af9c-57d7bdbf93a9)

12. When finished, select "Start Attack" on the top right of the Burpsuite GUI. This will start our spam against the evil portal.

You have successfully pwned the evil portal.

![kaliburpview](https://github.com/user-attachments/assets/6980664a-49ad-4ee4-845f-9d7bc1f8344b)
![flipperburpview](https://github.com/user-attachments/assets/eeb59b02-7a1a-4e09-ac54-281c4b749dc8)

# Spam Flipper Zero Evil Portals
![flipperburpview](https://github.com/user-attachments/assets/587a2994-f81b-4ca8-9bc2-7e0d075caf28)

Nothing quite upsets a skid like watching their Flipper Zeros' SD card slowly fill with spam, not knowing how to stop it. We will be spamming Flipper Zero evil portals using [Burpsuite](https://www.kali.org/tools/burpsuite/) in [Kali Linux.](https://www.kali.org/)

1. Burpsuite is a tool used for web application penetration testing. It works by allowing the user to intercept and manipulate web traffic occuring between the internet browser and the server in the form of things such as Http GET requests. In order for us to use this tool we will first need to setup a proxy. The easiest method to do this is by using the Firefox extension [FoxyProxy.](https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/)

After adding the extension to the browser, select it, go to the "Proxies" tab and create a new proxy with the following selections,

![fp](https://github.com/user-attachments/assets/c0844b0b-291e-4f72-965f-4b3ea6db213c)

Once this is completed, save and close out of the proxy settings.

2. Connect your machine to the evil portal.

3. Launch Burpsuite by using the command ```burpsuite``` in terminal or by searching for burpsuite in the tools menu and then proceed through the start up prompts.

4. Navigate to the evil portal login prompt in your browser and then enable your proxy in the foxyproxy extension.

  ![1](https://github.com/user-attachments/assets/65cde396-20d0-40ab-90a7-8db81d257cb2)

5. Once you have Burpsuite open and your proxy enabled, navigate to the ```Proxy``` tab and turn ```Intercept on``` by selecting it in Burpsuite.

6. Navigate back to the evil portal login portal and enter "username" and "password" into the respective username and password fields.

7. Navigate back to Burpsuite and you will notice that your http GET request has been captured (this is the raw data request of you attempt to login.

8. Right click in the data field of the http GET request and select ```Send to Intruder```, once complete turn ```Intercept off``` by selecting it.

![bs1](https://github.com/user-attachments/assets/0af03ad6-f9cd-4827-ae16-a4ceaa413fe7)

9. Navigate to the Intruder tab where you will see your http GET request. Select ```Add 

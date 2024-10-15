# Spam Flipper Zero Evil Portals
![flipperburpview](https://github.com/user-attachments/assets/587a2994-f81b-4ca8-9bc2-7e0d075caf28)

Nothing quite upsets a skid like watching their Flipper Zeros' SD card slowly fill with spam, not knowing how to stop it. We will be spamming Flipper Zero evil portals using [Burpsuite](https://www.kali.org/tools/burpsuite/) in [Kali Linux.](https://www.kali.org/)

1. Burpsuite is a tool used for web application penetration testing. It works by allowing the user to intercept and manipulate web traffic occuring between the internet browser and the server in the form of things such as http GET requests. In order for us to use this tool we will first need to setup a proxy. The easiest method to do this is by using the Firefox extension [FoxyProxy.](https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/)

After adding the extension to the browser, select it and go to the "Proxies" tab and create a new proxy with the following selections,

![fp](https://github.com/user-attachments/assets/c0844b0b-291e-4f72-965f-4b3ea6db213c)

Once this is completed, save and close out of the proxy settings.

2. Connect your machine to the evil portal.

3. Launch Burpsuite by using the command ```burpsuite``` in terminal or by searching for burpsuite in the tools menu and then proceed through the start up prompts.

4. Navigate to the evil portal login prompt in your browser and then enable your proxy in the foxyproxy extension by selecting it.

  ![1](https://github.com/user-attachments/assets/65cde396-20d0-40ab-90a7-8db81d257cb2)

5. Once you have Burpsuite open and your proxy enabled, navigate to the "Proxy" tab in Burpsuite and turn "Intercept On" by selecting it.

6. Navigate back to the evil portal login portal and enter "username" and "password" into the respective username and password fields and select login.

![portalshow](https://github.com/user-attachments/assets/005f2299-e454-411c-8ad2-74dee0c8950e)

7. Navigate back to Burpsuite and you will notice that your http GET request has been captured (this is the raw data request of your attempt to login.

8. Right click in the data field of the http GET request and select "Send to Intruder", once complete turn "Intercept Off" by selecting it.

![bs1](https://github.com/user-attachments/assets/0af03ad6-f9cd-4827-ae16-a4ceaa413fe7)

9. Navigate to the Intruder tab where you will see your http GET request. Select "Auto" (on the far right), which will highlight the username and password field. This will tell Burpsuite which areas of the http GET request to spray.

![bs2](https://github.com/user-attachments/assets/6ef5a99d-8837-4cd9-b6f8-c809e5b06017)

10. Select "Cluster Bomb" for the Attack type and then select the Paylods tab directly above "Choose an attack type".

11. Here we will need a wordlist to load into Burpsuite so we can spray the evil portal with spam. I chose to use my own, but any wordlist will work. Select "Payload set: 1" and Payload type: Simple list". In the "Payload settings [Simple List]" area type "PORTAL PWN" into the text bar next to "Add", and then add it by selecting "Add".

![bs3](https://github.com/user-attachments/assets/5cc65b6c-78ac-42d0-b107-dca8bc44d11f)

Select "Payload set: 2" and Payload type: Simple list". In the "Payload settings [Simple List]" area select "Load" and select your wordlist of choice.

![bs4](https://github.com/user-attachments/assets/0dee6ef4-c9ac-42fb-be71-0b0edc295e9c)

When finished, select "Start Attack" on the top right of the Burpsuite GUI. This will start our spam against the evil portal.

#You have successfully pwned the evil portal.

![kaliburpview](https://github.com/user-attachments/assets/71898c57-ead2-4229-8249-3cd59f708485)

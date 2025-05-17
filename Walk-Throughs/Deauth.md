# Deauth Flipper Zero Evil Portals

This guide will teach you to use the [aircrack-ng](https://www.kali.org/tools/aircrack-ng/) suite shipped in [Kali Linux](https://kali.org) to perform deauth attacks against Flipper Zero evil portals, kicking **ALL** clients connected to the portal off of the network.

For this guide you will need a wifi adapter that is capable of monitor mode and packet injection. I chose to use an Alfa AWUS036ACM as it is plug and play with Kali Linux.

1. Once you have spun up Kali and connected your wifi adapter, we must start by killing any processes that may interfere with our adapter. This can be accomplished by entering ```sudo airmon-ng check kill``` in terminal.

2. Typically, Kali Linux labels the wireless adapter interface ```wlan0```, we can see what it is labeled by using the ```iwconfig``` command in the terminal. Once we have identified the interface of our wireless adapter we must use the ```airmon-ng``` tool to place our wifi adapter into monitor mode. This will allow us to monitor wireless packets in transit as well as perform packet injection attacks. This can be accomplished with ```sudo airmon-ng start wlan0```.

![monmode](https://github.com/user-attachments/assets/778bd5e0-4eeb-434d-b0b5-2c7264dea8c4)

We can confirm we have successfully placed our adapter into monitor mode by using the ```iwconfig``` command once again. You should now see the name of the wireless adpater change from ```wlan0``` to ```wlan0mon```, as well as ```Mode: Monitor```.

![iwconfig](https://github.com/user-attachments/assets/5f26e637-efeb-41ad-b88a-85e3d6d00846)

3. Once you have successfully placed your wireless adapter into monitor mode, it is time to scan for wireless networks. This can be accomplished with ```sudo airodump-ng wlan0mon```.

Where:

```sudo``` - Gives root privileges.

```airodump-ng``` - Is the tool used to scan for networks.

```wlan0mon``` - Specifies wireless adapter interface to use.

You will then see a list of scanned access points display in the terminal. Use the keyboard shortcut ```ctrl + c``` to stop scanning when you see the evil portal access point name (ESSID) listed. Highlight the entire line of data points for the access point of the evil portal and set that information aside (in something like a text editor) to be used next.

![airodump](https://github.com/user-attachments/assets/0eab0927-d6c6-4a91-bea8-67387f9c44fd)

4. Now target scan the access point by using the command ```sudo airodump-ng --bssid xx:xx:xx:xx:xx:xx --channel x wlan0mon```, inputing the information of the evil portal that we have recently set aside into the "x" positions.

Where,

```sudo``` - Gives root privileges.

```airodump-ng``` - Is the tool used to scan for networks.

```--bssid xx:xx:xx:xx:xx``` - Is the MAC address of the evil portal.

```--channel x``` - Is the channel on which the evil portal is running.

```wlan0mon``` - Specifies wireless adapter interface to use.

Begin scanning. You will see all other access points are not displayed (only the evil portal) and any clients connected to the evil portal are displayed toward the bottom of the terminal window. After a few moments stop the scan with ```ctrl + c``` and then ```clear``` the terminal window. Doing this targetted scan ensures our wiresless adapter is placed onto the correct channel.

5. The final step, we will now use ```aireplay-ng``` to deauth **ALL** clients off of the evil portal network. This can be accomplished by using the command ```sudo aireplay-ng --deauth 0 -a 11:22:33:44:55:66 wlan0mon```.

Where,

```sudo``` - Gives root privileges.

```aireplay-ng``` - Is the tool that will inject deauthentication packets.

```--deauth 0``` - Tells the tool to send an infinite number of deauth packets.

```-a 11:22:33:44:55:66``` - Identifies the MAC address that the wireless adapter will spoof.

```wlan0mon``` - Specifies wireless adapter interface to use.

You will begin to see deauthentication packets being injected by your wireless adapter via the terminal, knocking all clients off the evil portal. This can be stopped at any time by using ```ctrl + c```.

![aireplay](https://github.com/user-attachments/assets/a4a67766-6cae-4e2b-a4b6-19e258d16e72)

You have successfully pwned the evil portal.

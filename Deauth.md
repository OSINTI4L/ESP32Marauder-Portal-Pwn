# Deauth Flipper Zero Evil Portals

Have you ever attempted to deauth a device that is designed to deauth devices? Deauth inception if you will.
This guide will teach you to use the [aircrack-ng](https://www.kali.org/tools/aircrack-ng/) suite shipped in [Kali Linux](https://kali.org) to deauth Flipper Zero Evil Portals, kicking **ALL** clients connected to the portal off the network; subsequently saving the day of course.

For this guide you will need a wifi adapter that is capable of monitor mode and packet injection. I chose to use an Alfa AWUS036ACM as it is plug and play with Kali Linux.

1. Once you have spun up Kali and connected your wifi adapter, we must start by killing any processes that may interfere with our adapter. This can be accomplished by entering ```sudo airmon-ng check kill``` in terminal.

3. Typically, Kali Linux labels the wireless adapter interface ```wlan0```, we can see what it is labeled by using the ```iwconfig``` command in the terminal. Once we have identified the interface of our wireless adapter we must use the ```airmon-ng``` tool to place our wifi adapter into monitor mode. This will allow us to monitor wireless packets in transit as well as perform packet injection attacks. This can be accomplished with ```sudo airmon-ng start wlan0```.

![monmode](https://github.com/user-attachments/assets/ea224eef-25b7-4b16-87ac-1543c5556467)

We can confirm this by using the ```iwconfig``` command once again. You should now see the name of the wireless adpater change from ```wlan0``` to ```wlan0mon```, as well as ```Mode: Monitor```.

![iwconfig](https://github.com/user-attachments/assets/bbbc085f-57d3-4f70-9f22-6705a53384e2)

3. Once you have successfully placed your wireless adapter into monitor mode, it is time to scan for wireless networks. This can be accomplished with ```sudo airodump-ng wlan0mon```.

Where,

```sudo``` - Gives root privileges.

```airodump-ng``` - Is the tool used to scan for networks.

```wlan0mon``` - Specifies wireless adapter interface to use.

You will then see a list of scanned access points display in the terminal. Use the keyboard shortcut ```ctrl + c``` to stop scanning when you the access point name (ESSID). Highlight the entire line of data points for the access point of the evil portal and set that information aside (in something like a text editor) to be used next.

![airodump](https://github.com/user-attachments/assets/30d831d7-b472-4f95-a923-9fffcfe555e1)

4. Now target the access point by using the command ```sudo airodump-ng --bssid xx:xx:xx:xx:xx:xx --channel x wlan0mon```, inputing the information of the evil portal that we have recently set aside into the "x" positions.

Where,

```sudo``` - Gives root privileges.

```airodump-ng``` - Is the tool used to scan for networks.

```--bssid xx:xx:xx:xx:xx``` - Is the MAC address of the evil portal.

```--channel x``` - Is the channel on which the evil portal is running.

```wlan0mon``` - Specifies wireless adapter interface to use.

Begin scanning. You will see all other access points are not displayed (only the evil portal) and any clients connected to the evil portal are displayed toward the bottom of the terminal window. After a few moments stop the scan with ```ctrl + c``` and then ```clear``` the terminal window.

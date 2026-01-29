<div align="center">

# ESP32Marauder Portal Pwn
![f2](https://github.com/user-attachments/assets/3baa6c7a-23cf-48de-9840-2f03bfe45d07)
![marauderskull](https://github.com/user-attachments/assets/55eeedb7-a1b0-43ce-ae0f-b657973ea16a)

</div>

Here you will find walk-throughs for various methods to crash, deauth, MITM, and spam ESP32Marauder evil portals utilizing [Kali Linux](https://www.kali.org/), as well as *the* Blunderbuss.sh payload (see below). For this guide, we will be targeting evil portals spun-up on the [Flipper Zero](https://flipperzero.one/).

When attacking devices other than the Flipper Zero with the Hydra crash method you will need to change the IP address you are attacking as other devices do not consistantly spin-up webservers on 172.0.0.1 like the Flipper Zero does.

<div align="center">
  
## ↓ Walk-throughs ↓
## [Crash](https://github.com/OSINTI4L/ESP32Marauder-Portal-Pwn/blob/main/Walk-Throughs/Crash.md) | [Deauth](https://github.com/OSINTI4L/ESP32Marauder-Portal-Pwn/blob/main/Walk-Throughs/Deauth.md) | [MITM](https://github.com/OSINTI4L/ESP32Marauder-Portal-Pwn/blob/main/Walk-Throughs/MITM.md) | [Spam](https://github.com/OSINTI4L/ESP32Marauder-Portal-Pwn/blob/main/Walk-Throughs/Spam.md)

-----

# Blunderbuss.sh
</div>

Blunderbuss is a Linux Bash script designed to crash Flipper Zero and JCMK Marauder evil portals. The script uses "wrk" to generate 100s or 1000s of HTTP GET requests that will fill the portals' username/password login parameters with "TALLY HO", until it crashes it. The attack will attempt to maintain 1000 active connections, continuously sending HTTP GET requests for a 30 second period. It will then confirm that the portal is crashed by checking that the access point IP address the user is connected to has changed, if still up, it will send another "volley of fire" and then exit. If it has crashed after the first "volley of fire", it will alert the user and exit. This will also fill some of the evil portals' log.txt files with "TALLY HO" spam.

<div align="center">
  
## ↓ Blunderbuss.sh Payload ↓
## [Blunderbuss.sh](https://github.com/OSINTI4L/ESP32Marauder-Portal-Pwn/blob/main/Blunderbuss_Payload/Blunderbuss.sh)

-----

A Hak5 Pineapple Pager ported payload can be found [here](https://github.com/OSINTI4L/ESP32Marauder-Portal-Pwn/blob/main/PineapplePagerPayload.sh).

</div>

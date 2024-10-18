# Crash Flipper Zero Evil Portals

![flipperviewhydra](https://github.com/user-attachments/assets/9e3615e4-de7b-4edc-a2d3-15b543f0eb38)

Here you will learn how to crash evil portals.

We will be utilizing the tools [Hydra](https://www.kali.org/tools/hydra/) and the [rockyou.txt wordlist](https://www.kali.org/tools/wordlists/) inside of [Kali Linux.](https://www.kali.org/)

It is important to note that the Flipper Zero Marauder app spins its' evilportal webservers on IP address 172.0.0.1.

![ipshow](https://github.com/user-attachments/assets/4d5cfb49-c2e0-4132-a436-5d6d56405c2e)

1. Once you have identified the evilportal SSID, start by connecting to it.
2. (In Kali Linux), we will now be working out of the Terminal using hydra. Hydra is a bruteforcing tool used to credential spray login portals, but we will be using this to spam the evilportal at an accelerated rate, ultimately overloading the evilportal webserver and crashing it. To do this we will need a wordlist to load into hydra so that it has a source from which to spam credentials fom.
3. The wordlist I will be using is the infamous ```rockyou.txt```. This wordlist is found in ```/usr/share/wordlists``` by default in Kali Linux. If you have never used this wordlist before, you may need to extract it with the command ```wordlists```.
4. We will then use the hydra syntax of ```hydra -L /usr/share/wordlists/rockyou.txt -P /usr/share/wordlists/rockyou.txt http-get://172.0.0.1 -t64```

Where:

```hydra``` - Tells the terminal to use this tool.

```-L /usr/share/wordlists/rockyou.txt``` - Tells Hydra to use a login file and specifies it to use the rockyou.txt wordlist.

```-P /usr/share/wordlists/rockyou.txt``` - Tells Hydra to use a password file and specifies it to use the rockyou.txt wordlist.

```http-get://172.0.0.1``` - Tells Hydra to use http-get request and to direct this attack at the IP address of 172.0.0.1.

```-t64``` - Tells Hydra how many to TASKS to run in parallel per target, the more TASKS, the faster the input. This is the key to crashing the evilportal webserver (64 is the max supported number of TASKS).

5. When connected to the evilportal and you have run the above commands, you will see Hydra start to spam login credentials at the evil portal. After a short amount of time, you will see Hydra hang and no longer attempt to spam credentials. You will also see your machine disconnect from the evil portal. This is because,

### you have successfully pwned the evil portal :)
![kaliviewhydra](https://github.com/user-attachments/assets/193bc121-2308-44e9-a7a2-ecb4bd4e6663)
![flipperviewhydra](https://github.com/user-attachments/assets/7402f0ad-7de0-4303-a5e2-c947c96a5b34)

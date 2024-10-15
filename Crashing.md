# How To Crash Flipper Zero Evil Portals
![image](https://github.com/user-attachments/assets/6fc03904-9cdf-4ff2-b34d-eecb66045a34)
![image](https://github.com/user-attachments/assets/b29e4d5c-db24-4d10-8110-ce619457bc6e)

Here you will learn how to crash evil portals.

We will be utilizing the tools [Hydra](https://www.kali.org/tools/hydra/) (used for brute-forcing login credentials) and the [rockyou.txt wordlist](https://www.kali.org/tools/wordlists/) inside of [Kali Linux.](https://www.kali.org/)

It is important to note that the Flipper Zero Marauder app spins its' evilportal webservers on IP address 172.0.0.1.

![ipshow](https://github.com/user-attachments/assets/4d5cfb49-c2e0-4132-a436-5d6d56405c2e)

1. Once you have identified the evilportal SSID, start by connecting to it.
2. (In Kali Linux), we will now be working out of the Terminal using hydra. Hydra is a bruteforcing tool used to credential spray login portals, but we will be using this to spam the evilportal at an accelerated rate, ultimately overloading the evilportal webserver and crashing it. To do this we will need a wordlist to load into hydra so that it has a source from which to spam credentials fom.
3. The wordlist I will be using is the infamous ```rockyou.txt```. This wordlist is found in ```/usr/share/wordlists``` by default in Kali Linux.
4. We will then use the hydra syntax of ```hydra -L /usr/share/wordlists/rockyou.txt -P /usr/share/wordlists/rockyou.txt http-get://172.0.0.1 -t64```

Where:

```hydra``` - Tells the terminal to use this tool.

```-L /usr/share/wordlists/rockyou.txt``` - Tells Hydra to use a login file and specifies it to use the rockyou.txt wordlists.

```-P /usr/share/wordlists/rockyou.txt``` - Tells Hydra to use a password file and specifies it to use the rockyou.txt wordlists.

```http-get://172.0.0.1``` - Tells Hydra to use http-get request and to direct this attack on the IP address of 172.0.0.1.


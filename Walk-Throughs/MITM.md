<div align="center">
  
# MITM Sniffing Flipper Zero Evil Portals
  
![image](https://github.com/user-attachments/assets/4e3b6715-8c03-40af-ac7a-8a20738adb03)
![image](https://github.com/user-attachments/assets/543b68de-3f45-498c-9633-8119a34de546)
</div>


We will be utilizing an ARP Poisoning attack against the Flipper Zero evil portal (EP) in order to man in the middle the traffic that interacts with it. An explanation of ARP poisoning (and the source of the techniques we will be using) can be found [here](https://www.youtube.com/watch?v=-rSqbgI7oZM). Let's apply this methodology against evil portals.

Because evil portals are spun-up using `HTTP` as opposed to `HTTPS`, this will allow us to sniff and see all credentials that are entered into the EP by connected clients in plain text. This means not only will the target have their credentials phished by the EP, we will be sniffing the credentials as well; unknown to both the target and the individual hosting the EP.

To accomplish this we will be using [Kali Linux](https://www.kali.org/), [Wireshark](https://www.kali.org/tools/wireshark/), and [Ettercap](https://www.kali.org/tools/ettercap/).

1. Begin by connecting to the evil portal network.

2. We must then identify our network interface (typically `eth0` or `wlan0`) used by Kali Linux. This can be accomplushed by using the `ifconfig` command.

![ifconfig](https://github.com/user-attachments/assets/9c8f595a-d3d2-43b9-ad96-24effa7ec1d7)

3.  We will begin our attack with the following syntax:

`sudo ettercap -T -S -i eth0 -M arp:remote`

Where:

  `sudo`: Gives elevated privileges
  
  `ettercap`: Specifies that we are using the Ettercap tool
  
  `-T`: Uses the text only interface (no GUI)
  
  `-S`: Disables ettercap from attempting to SSL strip `HTTPS` (as EP uses `HTTP`, this is not needed)
  
  `-i eth0`: Tells ettercap to use the `eth0` interface (that we discovered earlier)
  
  `-M arp:remote`: Specifies that it is a man in the middle attack, and `METHOD:ARGS` are `arp:remote` which specifies ARP poisoning and to include outbound traffic through the gateway.

4. Ettercap will then scan the IP address range of the EP network and build a hosts list of clients connected to the EP; it will then start the ARP Poisoning attack:

![etterstartup](https://github.com/user-attachments/assets/ec6a95e6-828e-4e3a-bfb6-a72aa88ecadf)

5. Open `wireshark` and filter the intercepted traffic by `http`. When a client enters their credentials into the EP we can view the credentials and which IP address (client) sent them in plain text:

Example:

  `172.0.0.2    475 GET /get?email=username123&password=password111 HTTP/1.1`
  
  `172.0.0.4    497 GET /get?email=us3rn4m3&password=p455w0rd HTTP/1.1`

![wireshark](https://github.com/user-attachments/assets/b05ac4d4-6f74-4f2e-8c6a-c193f5418ff6)

You have successfully MITM the evil portal.

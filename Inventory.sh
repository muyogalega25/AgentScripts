#!/bin/bash

#Description : script  is used for server inventory
#Author: Luv
#Date : 4/16/2021

#step1 :Declare variables
os=`head -1 /etc/*release|grep NAME| awk -F '"' '{print$2}'`
version=`head -2 /etc/*release|grep VERSION| awk -F '"' '{print$2}'`
tmem=`free -m|grep Mem| awk '{print$2}'`
umem=`free -m|grep Mem| awk '{print$3}'`
fmem=`free -m|grep Mem| awk '{print$4}'`
hdrv=`lsblk |grep sda| awk '{print$4}'|head -1`
spd=`lscpu |grep MHz|awk '{print$3}'`
ker=`uname -r |awk -F'-' '{print$1}'`
sysbits=`arch |awk -F'_' '{print$2}'`
hn=`hostname`
ip=`hostname -I | awk '{print$1}'`
lp=`netstat -punta |grep LISTEN`
dns=`grep "nameserver" /etc/resolv.conf |head -2`
mfr=`dmidecode - t system|grep Manufacturer`
virt=`dmidecode |grep -A2 '^System Information'|tail -1`
mac=`ifconfig|grep enp0s3 -A5|awk '{print$2}'|tail -1`

#step 2: checks if variable has no value

if [[ -z ${os} ]]
then echo "The logic used to determine the OS running failed."
exit 1


elif [[ -z ${version} ]]
then echo "The logic used to determine the OS version failed."
exit 2

elif [ -z ${tmem} ]
then echo "The logic used to determine the total memory failed."
exit 3

elif [ -z ${umem} ]
then echo "The logic used to determine the used memory failed."
exit 4

elif [ -z ${fmem} ]
then echo "The logic used to determine the free memory failed."
exit 5

elif [ -z ${hdrv} ]
then echo "The logic used to determine the hard drive failed."
exit 6

elif [ -z ${spd} ]
then echo "The logic used to determine the CPU speed failed."
exit 7

elif [ -z ${ker} ]
then echo "The logic used to determine the kernel version failed."
exit 8

elif [ -z ${sysbits} ]
then echo "The logic used to determine the system bits failed."
exit 9

elif [ -z ${hn} ]
then echo "The logic used to determine the hostname failed."
exit 10


elif [ -z ${ip} ]
then echo "The logic used to determine the IP address failed."
exit 11

elif [[ -z ${lp} ]]
then echo "The logic used to determine the listening ports failed."
exit 12

elif  [[ -z ${dns} ]]
then echo "The logic used to determine the DNS failed."
exit 13


elif [[ -z ${mfr} ]]
then echo "The logic used to determine the manufacturer failed."
exit 14

elif [[ -z ${virt} ]]
then echo "The logic used to determine the virtual or Physical system failed."
exit 15


elif [ -z ${mac} ]
then echo "The logic used to determine the MAC address failed."
exit 16

fi


#step 3: Output using variables


echo -e "-------- Operating System(OS) VERSION-------------------------"
echo "The OS running is ${os}  and version is ${version}"
echo
echo

echo -e "------------- Total memory in MHz-------------------------------"
echo "The total memory size: ${tmem}"
echo
echo

echo -e "-------------- Used memory in Mhz-------------------------------"
echo "The used memory size: ${umem}"
echo
echo

echo -e "--------------- Free memory in Mhz------------------------------"
echo "The free memory size :${fmem}"
echo
echo


echo -e "--------------------------- Hard drive--------------------------"
echo "The size of the hard drive is ${hdrv}"
echo
echo



echo -e "--------------------------- CPU Speed in Mhz-------------------"
echo "The CPU speed is ${spd} MHz"
echo
echo

echo -e "--------------------------- Kernel Version---------------------"
echo "The Kernel version is ${ker}"
echo
echo

echo -e "--------------------------- System bits------------------------"
echo "The system bits is ${sysbits}"
echo
echo

echo -e "--------------------------- Hostname---------------------------"
echo "The hostname is ${hn}"
echo
echo


echo -e "--------------------------- IP address------------------------"
echo "The ip address is ${ip}"
echo
echo

echo -e "--------------------------- all opened ports------------------"
echo "${lp}"
echo
echo

echo -e "--------------------------- system virtual or physical---------"
echo "${virt}"
echo
echo


echo -e "--------------------------DNS----------------------------------"
echo "${dns}"
echo
echo


echo -e "----------------------system manufacturer----------------------"
echo "${mfr}"
echo
echo

echo -e "-----------------MAC Address---------------------------------"
echo "${mac}"
echo
echo







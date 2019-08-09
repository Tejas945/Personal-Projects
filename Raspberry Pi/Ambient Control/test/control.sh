#! /bin/bash -x
#cat << EOF
declare -i roomtemp
sudo modprobe w1-gpio
sudo modprobe w1-therm
roomtemp=( $(cat /sys/bus/w1/devices/28-0000096026a8/w1_slave |grep -E -o ".{0,0}t=.{0,3}"| cut -c 3- ))
echo "Temp: $roomtemp"
if [ $roomtemp -gt 25]
 then
 { echo "temp is greater"
   python /home/pi/turn_fan_on.py
   # sleep 5 #wait 5 seconds
 }

elif [ $roomtemp -le 25]
then
{  echo"temp is lesser"
   python /home/pi/turn_fan_off.py
}


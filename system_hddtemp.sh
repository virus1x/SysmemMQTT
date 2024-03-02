#!/bin/bash
#Укажите адрес вашего брокера и учетные данные

date >> /home/virus/mqtt/cron_log.txt

ip=****
usr="****"
pass="****"

sdx[0]="sdb"
sdx[1]="sda"
sdx[2]="sdg"
sdx[3]="sdd"
sdx[4]="sdf"
sdx[5]="sde"
sdx[6]="sdc"


totalram=$(free -m | grep "Mem" | awk '{print $2}')
echo "Всего памяти: $totalram"

usedram=$(free -m | grep "Mem" | awk '{print $3}')
echo "Всего использовано памяти: $usedram"

usedrampercent=$(($usedram * 100 / $totalram))
echo "Всего использовано памяти в процентах: $usedrampercent"

totalswap=$(free -m | grep "Swap" | awk '{print $2}')
echo "Всего свопа: $totalswap"

usedswap=$(free -m | grep "Swap" | awk '{print $3}')
echo "Всего использовано свопа: $usedswap"

usedswappercent=$(($usedswap * 100 / $totalswap))
echo "Всего использовано свопа в процентах: $usedswappercent"

averageload=$(cat /proc/loadavg | awk '{print $2}')
averageload=$(echo "$averageload * 100" | bc)
echo "Средняя загрузка системы: $averageload"


tempcpu=$(sensors -A -u -j | jq '.["k10temp-pci-00c3"].temp1.temp1_input')
echo "Температура процессора: $tempcpu"

hddtemp_sdx[0]=$(hddtemp "/dev/sdb" -n)
echo "Температура диска 1: $hddtemp_sdx[0]"
hddtemp_sdx[1]=$(hddtemp "/dev/sda" -n)
echo "Температура диска 2: $hddtemp_sdx[1]"
hddtemp_sdx[2]=$(hddtemp "/dev/sdg" -n)
echo "Температура диска 2: $hddtemp_sdx[2]"
hddtemp_sdx[3]=$(hddtemp "/dev/sdd" -n)
echo "Температура диска 2: $hddtemp_sdx[3]"
hddtemp_sdx[4]=$(hddtemp "/dev/sdf" -n)
echo "Температура диска 2: $hddtemp_sdx[4]"
hddtemp_sdx[5]=$(hddtemp "/dev/sde" -n)
echo "Температура диска 2: $hddtemp_sdx[5]"
hddtemp_sdx[6]=$(hddtemp "/dev/sdc" -n)
echo "Температура диска 2: $hddtemp_sdx[6]"

echo "Публикация данных"


data="{"
for sdi in ${!sdx[*]}
do
data="${data}\"hddtemp_${sdx[$sdi]}\": ${hddtemp_sdx[sdi]}, "
done

data="${data}\"CPUtemp\":${tempcpu},\"FRAM\":${totalram},\"URAM\":${usedram},\"USRAM\":${usedswap},\"TSRAM\":${totalswap},\"CPUload\":${averageload}}"
echo "$data"
mosquitto_pub -h $ip -p 1883 -t "homeassistant/sensor/wallaby/data" -m "$data" -u $usr -P $pass

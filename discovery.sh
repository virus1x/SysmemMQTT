#!/bin/bash
#Укажите адрес вашего брокера и учетные данные
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

for sdi in ${sdx[*]}
do
device_class="{\"device_class\": \"temperature\","
name="\"name\": \"${sdi}\","
object_id="\"object_id\":\"hddtemp_${sdi}\","
uniq_id="\"uniq_id\":\"wallaby_hddtemp_${sdi}\","
unit_of_meas="\"unit_of_meas\":\"°C\","
expire_after="\"expire_after\":\"5000\","
state_topic="\"state_topic\":\"homeassistant/sensor/wallaby/data\","
val_tpl="\"val_tpl\":\"{{ value_json.hddtemp_${sdi}|default(0) }}\",";
device="\"device\": {\"ids\": [\"101\"],\"name\":\"wallaby\",\"mf\":\"Virus1х\",\"mdl\":\"HA_0.1\",\"sw\":\"0.1.0 26.01.23\"}}"
command="$device_class$name$object_id$uniq_id$unit_of_meas$expire_after$state_topic$val_tpl$device"
#echo $command
mosquitto_pub -h $ip -p 1883 -t "homeassistant/sensor/wallaby_hddtemp_${sdi}/config" -m "$command" -u $usr -P $pass
done

device_class="{\"device_class\": \"temperature\","
name="\"name\": \"CPUtemp\","
object_id="\"object_id\":\"CPUtemp\","
uniq_id="\"uniq_id\":\"wallaby_CPUtemp\","
unit_of_meas="\"unit_of_meas\":\"°C\","
expire_after="\"expire_after\":\"5000\","
state_topic="\"state_topic\":\"homeassistant/sensor/wallaby/data\","
val_tpl="\"val_tpl\":\"{{ value_json.CPUtemp|default(0) }}\","
device="\"device\": {\"ids\": [\"101\"],\"name\":\"wallaby\",\"mf\":\"Virus1х\",\"mdl\":\"HA_0.1\",\"sw\":\"0.1.0 26.01.23\"}}"
command="$device_class$name$object_id$uniq_id$unit_of_meas$expire_after$state_topic$val_tpl$device"
mosquitto_pub -h $ip -p 1883 -t "homeassistant/sensor/wallaby_CPUtemp/config" -m "$command" -u $usr -P $pass

device_class="{\"device_class\": \"data_size\","
name="\"name\": \"TotalRAM\","
object_id="\"object_id\":\"FRAM\","
uniq_id="\"uniq_id\":\"wallaby_FRAM\","
unit_of_meas="\"unit_of_meas\":\"MB\","
expire_after="\"expire_after\":\"5000\","
state_topic="\"state_topic\":\"homeassistant/sensor/wallaby/data\","
val_tpl="\"val_tpl\":\"{{ value_json.FRAM|default(0) }}\","
device="\"device\": {\"ids\": [\"101\"],\"name\":\"wallaby\",\"mf\":\"Virus1х\",\"mdl\":\"HA_0.1\",\"sw\":\"0.1.0 26.01.23\"}}"
command="$device_class$name$object_id$uniq_id$unit_of_meas$expire_after$state_topic$val_tpl$device"
mosquitto_pub -h $ip -p 1883 -t "homeassistant/sensor/wallaby_FRAM/config" -m "$command" -u $usr -P $pass

device_class="{\"device_class\": \"data_size\","
name="\"name\": \"UsedRAM\","
object_id="\"object_id\":\"URAM\","
uniq_id="\"uniq_id\":\"wallaby_URAM\","
unit_of_meas="\"unit_of_meas\":\"MB\","
expire_after="\"expire_after\":\"5000\","
state_topic="\"state_topic\":\"homeassistant/sensor/wallaby/data\","
val_tpl="\"val_tpl\":\"{{ value_json.URAM|default(0) }}\","
device="\"device\": {\"ids\": [\"101\"],\"name\":\"wallaby\",\"mf\":\"Virus1х\",\"mdl\":\"HA_0.1\",\"sw\":\"0.1.0 26.01.23\"}}"
command="$device_class$name$object_id$uniq_id$unit_of_meas$expire_after$state_topic$val_tpl$device"
mosquitto_pub -h $ip -p 1883 -t "homeassistant/sensor/wallaby_URAM/config" -m "$command" -u $usr -P $pass

device_class="{\"device_class\": \"data_size\","
name="\"name\": \"UsedSwap\","
object_id="\"object_id\":\"USRAM\","
uniq_id="\"uniq_id\":\"wallaby_USRAM\","
unit_of_meas="\"unit_of_meas\":\"MB\","
expire_after="\"expire_after\":\"5000\","
state_topic="\"state_topic\":\"homeassistant/sensor/wallaby/data\","
val_tpl="\"val_tpl\":\"{{ value_json.USRAM|default(0) }}\","
device="\"device\": {\"ids\": [\"101\"],\"name\":\"wallaby\",\"mf\":\"Virus1х\",\"mdl\":\"HA_0.1\",\"sw\":\"0.1.0 26.01.23\"}}"
command="$device_class$name$object_id$uniq_id$unit_of_meas$expire_after$state_topic$val_tpl$device"
mosquitto_pub -h $ip -p 1883 -t "homeassistant/sensor/wallaby_USRAM/config" -m "$command" -u $usr -P $pass

device_class="{\"device_class\": \"data_size\","
name="\"name\": \"TotalSRAM\","
object_id="\"object_id\":\"TSRAM\","
uniq_id="\"uniq_id\":\"wallaby_TSRAM\","
unit_of_meas="\"unit_of_meas\":\"MB\","
expire_after="\"expire_after\":\"5000\","
state_topic="\"state_topic\":\"homeassistant/sensor/wallaby/data\","
val_tpl="\"val_tpl\":\"{{ value_json.TSRAM|default(0) }}\","
device="\"device\": {\"ids\": [\"101\"],\"name\":\"wallaby\",\"mf\":\"Virus1х\",\"mdl\":\"HA_0.1\",\"sw\":\"0.1.0 26.01.23\"}}"
command="$device_class$name$object_id$uniq_id$unit_of_meas$expire_after$state_topic$val_tpl$device"
mosquitto_pub -h $ip -p 1883 -t "homeassistant/sensor/wallaby_TSRAM/config" -m "$command" -u $usr -P $pass

device_class="{\"device_class\": \"power_factor\","
name="\"name\": \"CPUload\","
object_id="\"object_id\":\"CPUload\","
uniq_id="\"uniq_id\":\"wallaby_CPUload\","
unit_of_meas="\"unit_of_meas\":\"%\","
expire_after="\"expire_after\":\"5000\","
state_topic="\"state_topic\":\"homeassistant/sensor/wallaby/data\","
val_tpl="\"val_tpl\":\"{{ value_json.CPUload|default(0) }}\","
device="\"device\": {\"ids\": [\"101\"],\"name\":\"wallaby\",\"mf\":\"Virus1х\",\"mdl\":\"HA_0.1\",\"sw\":\"0.1.0 26.01.23\"}}"
command="$device_class$name$object_id$uniq_id$unit_of_meas$expire_after$state_topic$val_tpl$device"
mosquitto_pub -h $ip -p 1883 -t "homeassistant/sensor/wallaby_CPUload/config" -m "$command" -u $usr -P $pass
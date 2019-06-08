echo "VERSION 1.0.1:  /airports/NL" >> blue_green_dep_logs.txt
echo "********************************************"  >> blue_green_dep_logs.txt
curl -I -s -L http://slachtec.local.airports/airports/NL | grep HTTP/1.1 >> blue_green_dep_logs.txt
echo "============================================"  >> blue_green_dep_logs.txt
echo "VERSION 1.1.0:  /airports/EHAM" >> blue_green_dep_logs.txt
echo "********************************************" >> blue_green_dep_logs.txt
curl -I -s -L http://slachtec.local.airports/airports/EHAM | grep HTTP/1.1 >> blue_green_dep_logs.txt
echo "============================================"  >> blue_green_dep_logs.txt

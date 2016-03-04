#!/bin/bash


echo  "This script is itended to test he connection between two hosts, one local and one remote"
echo ""
echo ""
echo ""
sleep 4	


# Get the name of the remote and create the script

echo "Enter the name of the remote host:"
read name
touch $name
touch "$name"2Local.sh
echo "#!/bin/bash" >> $name
echo "#!/bin/bash" >> "$name"2Local.sh 


echo "" >> $name
echo "" >> $name
echo "" >> "$name"2Local.sh
echo "" >> "$name"2Local.sh

echo "SITE=$name" >> $name
echo "SITE=$name" >> "$name"2Local.sh


echo ""



echo "Enter the ip of the remote host:"
read server
echo ""
echo "REMOTE_SERVER=$server" >> $name

echo "Enter the size of buffer window for the TCP connection (Recommended 64k,leave this field empty if you want to auto negociate):"
read window
echo ""
echo "WINDOW=$window" >> $name
echo "WINDOW=$window" >> "$name"2Local.sh


echo "Enter the time length for each test(In Seconds!):"
read time
echo ""
echo "TIME=$time" >> $name
echo "TIME=$time" >> "$name"2Local.sh


echo "Enter the number of iterations of the test(In Seconds!):"
read iteration
echo ""
echo "ITERATION=$iteration" >> $name
echo "ITERATION=$iteration" >> "$name"2Local.sh

echo "Enter the port number that will be used for the test:"
read port
echo ""
echo "PORT=$port" >> $name
echo "PORT=$port" >> "$name"2Local.sh


echo "Enter the bamdwidth that will be used in the UDP test(In Megabits/s, Example: 60m ):"
read bandwidth
echo ""
echo "BANDWIDTH=$bandwidth" >> $name
echo "BANDWIDTH=$bandwidth" >> "$name"2Local.sh

echo "Enter the local IP address that will connect to the remote host:"
read local_server
echo ""
echo "LOCAL_SERVER=$local_server" >> "$name"2Local.sh


cat local_connection.sh >> $name

cat remote_connection.sh >> "$name"2Local.sh

chmod u+x $name
chmod u+x "$name"2Local.sh

mv $name Local2"$name".sh








echo  "Script $name generated with success"



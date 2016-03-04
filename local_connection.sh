DELAY=20
outFile=test.${SITE}.local-remote.txt

if [ -z $WINDOW ]; then
	window=""
else
	window="-w $WINDOW"
fi

cat << EOF >$outFile

/////////////////////////////////////////////////////////////////////////

begining of the TCP test: `date`

EOF

iperf -c $REMOTE_SERVER $window -t $TIME -i $ITERATION -p $PORT >> $outFile

cat << EOF >>$outFile

ending of the TCP test: `date`

/////////////////////////////////////////////////////////////////////////

EOF

sleep 5

cat << EOF >>$outFile

begining of the UDP test: `date`

EOF

iperf -u -c $REMOTE_SERVER -t $TIME $window -i $ITERATION -b $BANDWIDTH  -p $PORT >> $outFile

cat << EOF >>$outFile

ending of the UDP test: `date`

/////////////////////////////////////////////////////////////////////////

EOF

#Start the servers after the first tests

iperf -s $window -p $PORT &

pid1=$!

iperf -s -u $window -p $PORT &

pid2=$!

#Time between tests

time2wait=`expr 2 \* $TIME + $DELAY` 

sleep $time2wait

# Kill the iperf servers process after the tests

kill $pid1

kill $pid2



# End of script

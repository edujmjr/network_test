DELAY=20
outFile=test.${SITE}.remote-local.txt

#Remote client open server first

if [ -z $WINDOW ]; then
	window=""

else
	window="-w $WINDOW"
fi

iperf -s $window -p $PORT &

pid1=$!

iperf -s -u $window -p $PORT &

pid2=$!

time2wait=`expr 2 \* $TIME + $DELAY`

sleep $time2wait

cat << EOF >$outFile

/////////////////////////////////////////////////////////////////////////

begining of the TCP test: `date`

EOF

iperf -c $LOCAL_SERVER $window -t $TIME -i $ITERATION -p $PORT >> $outFile

cat << EOF >>$outFile

ending of the TCP test: `date`

/////////////////////////////////////////////////////////////////////////

EOF

sleep 5

cat << EOF >>$outFile

begining of the UDP test: `date`

EOF

iperf -u -c $LOCAL_SERVER $window -t $TIME -i $ITERATION -b $BANDWIDTH  -p $PORT >> $outFile

cat << EOF >>$outFile

ending of the UDP test: `date`

/////////////////////////////////////////////////////////////////////////

EOF

# Kill the iperf servers process after the tests

kill $pid1

kill $pid2



# End of script

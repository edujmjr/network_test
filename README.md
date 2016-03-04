# network_test
Script that automate the creation of two other scripts to test network between two hosts using iperf.

# Instalation
This script was tested in Linux systems with shell script

you need to install iperf (https://iperf.fr/iperf-download.php) on both hosts.

# Using the script
Run the script ScritGenerator and anwser the questions about the two hosts.
After that two new scripts will be created, one local to remote and other remote to local. Put the remote-local on the remote host and run the remote before the local script.
Its is important that the two scripts execute almost at the same time, so the tests can perfom as expected.

# Important Tip
Use nohup and & with the run command of the scripts, so the script can run in background and if the ssh connection is lost for some reason, the script will continue to run.

Example:
nohup ./ScriptTest &

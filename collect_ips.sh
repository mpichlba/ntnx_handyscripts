#/bin/bash
# the script collects the cluster and SVM IPs and prints them in a format that can be used to whitelist them in the firewall for CCLM
# it assumes that the svmips command is available and returns the SVM IPs
# it also assumes that the ncli command is available and returns the cluster information
# the script prints the command to whitelist the IPs in the firewall for CCLM
clusterip=$(ncli cluster info | awk -F: '/External IP/ {gsub(/^ /, "", $2); print $2}')
svmips=$(for a in $(svmips); do echo -n "$a," ; done)
allips=$(echo -n $svmips$clusterip)
echo "Cluster and SVM IPs:"
echo $allips
echo "Now you can execute the following command to whitelist these IPs for enabling CCLM:"
echo  allssh \"modify_firewall -f -r $allips -p 2030,2036,2073,2090 -i eth0\"


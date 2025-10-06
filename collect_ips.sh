#/bin/bash
clusterip=$(ncli cluster info | awk -F: '/External IP/ {gsub(/^ /, "", $2); print $2}')
svmips=$(for a in $(svmips); do echo -n "$a," ; done)
allips=$(echo -n $svmips$clusterip)
echo $allips

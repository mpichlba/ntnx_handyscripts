# collect_ips.sh

## Overview

collect_ips.sh is a Bash script designed to gather the cluster and SVM (Storage Virtual Machine) IP addresses from a Nutanix environment. It outputs these IPs in a format suitable for whitelisting in a firewall, specifically for enabling CCLM (Cross Cluster Life Migration).

## Features

- Collects the external cluster IP using `ncli`.
- Collects all SVM IPs using the `svmips` command.
- Outputs a single, comma-separated list of all relevant IPs.
- Provides a ready-to-use command for whitelisting these IPs in the firewall.

## Prerequisites

- The `ncli` command-line tool must be installed and accessible.
- The `svmips` command must be available and return SVM IPs.
- Bash shell environment.
- all of the above is available when logging into a CVM

## Usage

1. Source the script executable:
   ```
   chmod +x collect_ips.sh
   ```

2. Run the script:
   ```
   ./collect_ips.sh
   ```

3. The script will output:
   - The collected Cluster and SVM IPs.
   - A command to whitelist these IPs for CCLM in the firewall.

## Example Output

```
Cluster and SVM IPs:
10.1.1.10,10.1.1.11,10.1.1.12
Now you can execute the following command to whitelist these IPs for enabling CCLM:
allssh "modify_firewall -f -r 10.1.1.10,10.1.1.11,10.1.1.12 -p 2030,2036,2073,2090 -i eth0"
```

## Notes

- Ensure you have the necessary permissions to run `ncli` and `svmips`.
- The script assumes the default interface is `eth0` and ports `2030,2036,2073,2090` are required for CCLM.

## License

MIT License (or specify your license here).
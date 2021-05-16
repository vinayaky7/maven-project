## Please find myscript.txt file in this branch for user data & then run the aws cli command to launch the instance accordingly

## Please update /etc/ansible/hosts file to disable host key verification for Testing/UAT/Dev VM to avoid discrepancy in the playbooks. Please follow below sample file

# This is the default ansible 'hosts' file.
#
# It should live in /etc/ansible/hosts
#
#   - Comments begin with the '#' character
#   - Blank lines are ignored
#   - Groups of hosts are delimited by [header] elements
#   - You can enter hostnames or ip addresses
#   - A hostname/ip can be a member of multiple groups

# Ex 1: Ungrouped hosts, specify before any group headers.
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansibleclient1
my-dev-box ansible_ssh_common_args='-o StrictHostKeyChecking=no'
## green.example.com
## blue.example.com
## 192.168.100.1
## 192.168.100.10

# Ex 2: A collection of hosts belonging to the 'webservers' group
[webservers]
ansibleclient1
my-dev-box ansible_ssh_common_args='-o StrictHostKeyChecking=no'
## alpha.example.org
## beta.example.org
## 192.168.1.100
## 192.168.1.110

# If you have multiple hosts following a pattern you can specify
# them like this:

## www[001:006].example.com

# Ex 3: A collection of database servers in the 'dbservers' group

## [dbservers]
##
## db01.intranet.mydomain.net
## db02.intranet.mydomain.net
## 10.25.1.56
## 10.25.1.57

# Here's another example of host ranges, this time there are no
# leading 0s:

## db-[99:101]-node.example.com

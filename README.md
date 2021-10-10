## Please follow below steps to use aws cli command line utility on jenkins infra

#### Please find user_data_ansible_client.txt file in this branch for user data & then run the aws cli command to launch the instance accordingly. The user data contains informations such setting Hostname, Mounting EFS volume, Copying Jenkins-Master/Slave's public key on clients /home/ec2-user/.ssh/authorized_keys file to initiate passowordless authentication between Ansible Master & the client. 

#### Please make sure to use the same Hostname in Ansible Playbook as mentioned in the user_data_ansible_client.txt file.

#### Please use correct command in the user_data_ansible_client.txt file to mount EFS volume.

#### Please add AWS Access key & Secret Access Key in Jenkins Credentials using AWS EC2 Plugin. The credentials are added in the Jenkinsfile as a label "myawscreds". So make sure you add credentials in Jenkins as a same Label.

#### Please update /etc/ansible/hosts & /etc/ansible/ansible.cfg file to disable host key verification for Testing/UAT/Dev VM to avoid discrepancy in the playbooks. Please follow below sample file which you must add in /etc/ansible/host against every Host you need to disable host key verification & /etc/ansible/ansible.cfg file.

/etc/ansible/hosts

[webservers]

ansibleclient1

testvm-dev ansible_ssh_common_args='-o StrictHostKeyChecking=no'

================

/etc/ansible/ansible.cfg

[defaults]

log_path = ./ansible.log

host_key_checking = False


#### Please update aws ec2 run-instances command with correct arguments before running it to avoid errors. We have used a specific IP of the testvm-dev "172.31.28.91" whose entry already exist in the /etc/ansible/hosts file & /etc/hosts file of the Ansible Master which is our Jenkins-Slave. Please update the IP as per your VPC & Subnet. Please follow below sample files.  

#### Please use below link to get proper image id for your region. Image ID's are based on speciic regions.

https://aws.amazon.com/amazon-linux-ami/

[root@jenkins-slave ~]# cat /etc/hosts

127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4

::1         localhost6 localhost6.localdomain6

172.31.62.73 ansibleclient1

172.31.28.91  testvm-dev

[root@jenkins-slave ~]# cat /etc/ansible/hosts

Ex 2: A collection of hosts belonging to the 'webservers' group

[webservers]

ansibleclient1

testvm-dev ansible_ssh_common_args='-o StrictHostKeyChecking=no'

alpha.example.org

beta.example.org

192.168.1.100

192.168.1.110





### Please find my_script.txt file in this branch for user data & then run the aws cli command to launch the instance accordingly. The user data contains informations such setting Hostname, Mounting EFS volume, Copying Jenkins-Master/Slave's public key on clients /home/ec2-user/.ssh/authorized_keys file to initiate passowordless authentication between Ansible Master & the client. 

### Please make sure to use the same Hostname in Ansible Playbook as mentioned in the my_script.txt.

### Please update /etc/ansible/hosts file to disable host key verification for Testing/UAT/Dev VM to avoid discrepancy in the playbooks. Please follow below sample line which you must add against every Host you need to disable host key verification.

## my-dev-box ansible_ssh_common_args='-o StrictHostKeyChecking=no'




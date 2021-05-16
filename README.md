### Please find user_data_ansible_client.txt file in this branch for user data & then run the aws cli command to launch the instance accordingly. The user data contains informations such setting Hostname, Mounting EFS volume, Copying Jenkins-Master/Slave's public key on clients /home/ec2-user/.ssh/authorized_keys file to initiate passowordless authentication between Ansible Master & the client. 

### Please make sure to use the same Hostname in Ansible Playbook as mentioned in the user_data_ansible_client.txt file.

### Please use correct command in the user_data_ansible_client.txt file to mount EFS volume.

### Please add AWS Access key & Secret Access Key in Jenkins Credentials using AWS EC2 Plugin. The credentials are added in the Jenkinsfile as a label "myawscreds". So make sure you add credentials in Jenkins as a same Label.

### Please update /etc/ansible/hosts file to disable host key verification for Testing/UAT/Dev VM to avoid discrepancy in the playbooks. Please follow below sample line which you must add against every Host you need to disable host key verification.

## my-dev-box ansible_ssh_common_args='-o StrictHostKeyChecking=no'




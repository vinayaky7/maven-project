### Please find my_script.txt file in this branch for user data & then run the aws cli command to launch the instance accordingly

### Please update /etc/ansible/hosts file to disable host key verification for Testing/UAT/Dev VM to avoid discrepancy in the playbooks. Please follow below sample line which you must add against every Host you need to disable host key verification.

## my-dev-box ansible_ssh_common_args='-o StrictHostKeyChecking=no'




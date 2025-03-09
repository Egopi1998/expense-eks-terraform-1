* connecting Bastion as Agent to jenkins --> run below commands in bastion/agent 
```
yum install fontconfig java-17-openjdk jenkins -y
ssh-keygen
```
* copy the ~/.ssh/id_rsa.pub and paste it in the ~/.ssh/authorized_keys
```
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh
```

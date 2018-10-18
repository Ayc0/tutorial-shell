#!/bin/zsh

adduser --shell /bin/zsh --disabled-password --gecos "" $1
echo $1':'$2 | chpasswd 
# usermod -aG sudo $1
mv /var/users/login/*(D) /home/$1/

adduser --shell /bin/zsh --disabled-password --gecos "" level1
echo "level1:let_me_pass_please" | chpasswd

# Change rights to correct user
for f in $(ls /home/); do 
  chown -R "$f:$f" /home/$f/
  chmod -R o=- /home/$f/
done

# Add ssh keys
ssh-keygen -A

# Start ssh server
/usr/sbin/sshd -D

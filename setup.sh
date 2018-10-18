#!/bin/zsh

adduser --shell /bin/zsh --disabled-password --gecos "" $1
echo $1':'$2 | chpasswd 
# usermod -aG sudo $1
mv /var/users/login/*(D) /home/$1/
rmdir /var/users/login/

for user in $(ls /var/users/); do 
  adduser --shell /bin/zsh --disabled-password --gecos "" $user
  mv /var/users/$user/*(D) /home/$user/
  rmdir /var/users/$user/
done

rmdir /var/users/

# Passwords
echo "level1:let_me_pass_please" | chpasswd
echo "level2:you_found_me_yeah" | chpasswd


# Change rights to correct user
for user in $(ls /home/); do 
  chown -R "$user:$user" /home/$user/
  chmod -R o=- /home/$user/
done

# Add ssh keys
ssh-keygen -A

# Start ssh server
/usr/sbin/sshd -D

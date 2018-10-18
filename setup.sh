#!/bin/zsh

# Create a user without password and with zsh
adduser --shell /bin/zsh --disabled-password --gecos "" $1
# user:passwort
echo $1':'$2 | chpasswd
mv /var/users/login/*(D) /home/$1/
rmdir /var/users/login/

mv /var/users/root/*(D) /root/
rmdir /var/users/root/

for user in $(ls /var/users/); do 
  adduser --shell /bin/zsh --disabled-password --gecos "" $user
  mv /var/users/$user/*(D) /home/$user/
  rmdir /var/users/$user/
done

rmdir /var/users/

# Passwords
echo "level1:let_me_pass_please" | chpasswd
echo "level2:you_found_me_yeah" | chpasswd
echo "level3:I_have_finally_reunited" | chpasswd
echo "level4:399cb02b3ad8043989ec3a736394f851" | chpasswd

# Level 2
tar -cjf /home/level2/password.tar /home/level2/password
split -b 50 -a 1 /home/level2/password.tar "/home/level2/password.tar.part."
rm -f /home/level2/password /home/level2/password.tar
mv /home/level2/password.tar.part.d /home/level2/foo/bar/missing_part.yolo
chmod +x /home/level2/unzip.sh

# Change rights to correct user
for user in $(ls /home/); do 
  chown -R "$user:$user" /home/$user/
  chmod -R o=- /home/$user/
done

# Add ssh keys
ssh-keygen -A

# Start ssh server
/usr/sbin/sshd -D

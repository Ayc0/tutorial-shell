#!/bin/zsh

# Create a user without password and with zsh
adduser --shell /bin/zsh --disabled-password --gecos "" $1
# user:password
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

chmod +x /var/bin/su
rm -f /bin/su

# Passwords
echo "level1:let_me_pass_please" | chpasswd
echo "level2:you_found_me_yeah" | chpasswd
echo "level3:I_am_finally_reunited" | chpasswd
echo "level4:dfb7df1c9c530db5babda231838691bcf6ed022611cda1a899ccc12b651ff9f3" | chpasswd
echo "level5:greeting" | chpasswd
echo "tests:vghjhy7^&uhgtr%6789okiUYTr456y" | chpasswd

# Level 2
cd /home/level2
tar -cjf password.tar password
split -b 50 -a 1 password.tar "password.tar.part."
rm -f password password.tar
mkdir -p foo/bar
mv password.tar.part.d foo/bar/missing_part.yolo
cd -

# Level 4
cd /home/level4
python3 setup.py
rm -f setup.py toSql.txt
chmod +x .diff
chmod +x .run.py
cd -

# Bonus 
chmod +x /home/bonus/answer.sh

# Change rights to correct user
for user in $(ls /home/); do 
  chown -R "$user:$user" /home/$user/
  chmod -R o=- /home/$user/
done

# Add ssh keys
ssh-keygen -A

# Start ssh server
/usr/sbin/sshd -D

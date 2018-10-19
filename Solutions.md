**Level `<user>`:**

(in `~/weird`)

```zsh
cat README.txt
cd ..
cat README.txt
su level1 (let_me_pass_please)
```

**Level 1:**

(in `/var/level1`)

Explain `/var`, `/etc`, `/home`, `/root`

```zsh
cd ~
cat README.txt
cd -
cat .password
su level2 (you_found_me_yeah)
```

**Level 2:**

```zsh
mv foo/bar/missing_part.yolo password.tar.part.d
chmod +x unzip.sh
./unzip.sh
su level3 (I_am_finally_reunited)
```

**Level 3:**

Correct file

```python
import hashlib

hash = hashlib.sha3_256()
hash.update("No one expects".encode("utf-8"))
hash.update(" the spanish inquisition".encode("utf-8"))

print(hash.hexdigest())
```

```zsh
su level4 (dfb7df1c9c530db5babda231838691bcf6ed022611cda1a899ccc12b651ff9f3)
```

**Level 4:**

`SQLite_parser.py`

```python
import sqlite3
conn = sqlite3.connect('sqlite.db')

c = conn.cursor()
c.execute('Select text_to_insert_in_file from data where is_useful=True')

text = c.fetchone()[0]
conn.close()

with open("./a.txt", "w") as file:
    file.write(text)
```

`CSV_parser.py`

```python
import csv

with open("./data.csv") as csv_file:
  csv_reader = csv.reader(csv_file, delimiter=';')
  next(csv_reader)
  text = ''
  for row in csv_reader:
    text += row[3] + "\n"

with open("./b.txt", "w") as file:
    file.write(text)
```

```zsh
diff a.txt b.txt
su level5 (greeting)
```

**Level 5:**

Edit `.zshrc`, change `export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"` to `export PATH="/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/sbin:$HOME/bin:/var/bin/"`

```zsh
source .zshrc
su (this_was_a_triumph, huge_success)
```

Find password in `/etc/root.passwd`

**Root:**

TADAAA

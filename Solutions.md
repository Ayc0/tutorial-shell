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
./unzip.sh
su level3 (I_have_finally_reunited)
```

**Level 3:**

```python
import hashlib

hash = hashlib.md5()
hash.update("No one expects".encode("utf-8"))
hash.update(" the spanish inquisition".encode("utf-8"))

print(hash.hexdigest())
```

```zsh
su level4 (399cb02b3ad8043989ec3a736394f851)
```

**Level 4:**

```python
import sqlite3
conn = sqlite3.connect('sqlite.db')

c = conn.cursor()
c.execute('Select text from data')

text = c.fetchone()[0]
conn.close()

with open("./a.txt", "w") as file:
    file.write(text)
```

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
su (greeting)
```

**Root:**

TADAAA

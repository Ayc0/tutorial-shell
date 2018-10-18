import sqlite3
conn = sqlite3.connect('sqlite.db')

c = conn.cursor()
c.execute('CREATE TABLE data (text text)')

with open("./toSql.txt") as f:
    c.execute("INSERT INTO data VALUES ('{}')".format(f.read()))

conn.commit()
conn.close()

import sqlite3
conn = sqlite3.connect('sqlite.db')

c = conn.cursor()
c.execute('CREATE TABLE data (col1 TEXT, col2 TEXT, col3 Boolean)')

with open("./file.txt") as f:
    c.execute("INSERT INTO data VALUES ('{}', 'String', 1)".format(f.read()))

c.execute("INSERT INTO data VALUES ('String', 'String', 0)")
conn.commit()

c.execute('Select col1 from data where col3=True')

c.fetchone()[0]

conn.close()

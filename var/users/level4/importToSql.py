import sqlite3
conn = sqlite3.connect('sqlite.db')

c = conn.cursor()
c.execute('CREATE TABLE data (text_to_insert_in_file TEXT, useless_data TEXT, is_useful Boolean)')

with open("./toSql.txt") as f:
    c.execute("INSERT INTO data VALUES ('{}', 'Ogres are like onions! They stink? Yes... No!', 1)".format(f.read()))

c.execute("INSERT INTO data VALUES ('qasha/gpafq\/oei/hwegp\okaso//fiua\gp/oakdsfoisdf', 'There is no spoon.', 0)")
conn.commit()

conn.close()

#!/usr/bin/python3

import sqlite3
import sys

conn = sqlite3.connect('sqlite.db')

command = sys.argv[1]

if command.lower().strip() == "show tables":
    command = 'SELECT name FROM sqlite_master WHERE type = "table"'

c = conn.cursor()
c.execute(command)

print(c.fetchall())
conn.close()
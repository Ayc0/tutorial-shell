level5's password is hidden among 2 datasets: one in a SQLite database and one in a CSV file.

1. you'll have to find which data is useful in those 2 datasets
2. then try to guess the password from them

For SQLite, you'll need those resources:
* https://docs.python.org/3/library/sqlite3.html
* https://docs.python.org/3/library/csv.html

And also, we created a small command "run" that allows you to run simple sql queries.
For instance:
* 'run "show tables"' to list every tables
* 'run "pragma table_info(<table_name>)"' to see the definition of a table

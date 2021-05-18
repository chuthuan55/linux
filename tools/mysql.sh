## create database
  create database database_name;

## create user
  CREATE USER 'abc'@'%' IDENTIFIED BY '1';
  GRANT ALL ON .* TO 'abc'@'%';
  FLUSH PRIVILEGES;

mysql -u root -p #đăng nhập mysql
> show databases;
> use databases_name;
> show tables;
> command
## command
  # show all column in table
    SELECT * FROM table_name;

  # show column in table
    SELECT column_name FROM table_name;

  # show condition in table
    SELECT * FROM table_name
    WHERE condition;

  # show all difference values
    SELECT DISTINCT column_name FROM table_name;

  # 'AND'
    SELECT column_name FROM table_name
    WHERE condition_1 AND condition_2 AND condition_N;

  # 'OR'
    SELECT column_name FROM table_name
    WHERE condition_1 OR condition_2 OR condition_N;

  # 'NOT'
    SELECT column_name FROM table_name
    WHERE NOT condition;

  # show user
    SELECT user,host FROM mysql.user; 

  # 'ORDER BY'
    SELECT column_name FROM table_name
    ORDER BY column_name [ASC;DESC];

  #  
# Add New User

```mysql
CREATE USER admin@localhost;
UPDATE mysql.user SET authentication_string = PASSWORD('password') WHERE User = 'admin';
```

## Set new Privileges

```mysql
GRANT ALL ON *.* TO admin@localhost WITH GRANT OPTION;
```

```GRANT ALL```: grant all the previlages

`*.*`: All the dbs, tables

`WITH GRANT OPTION`: also can create new user.

## Save and changes privileges

```mysql
FLUSH PRIVILEGES;
```


echo '[cleardb] deleting database tables!'
psql myTube < drop_database.sql
echo '[cleardb] creating new database tables!'
psql myTube < create_database.sql

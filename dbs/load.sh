echo 'Load database map'
mysql -u $1 -p $2  < dbs.sql

echo 'Load procedure'
mysql -u $1 -p $2  < ./proc/user.sql
mysql -u $1 -p $2  < ./proc/company.sql
mysql -u $1 -p $2  < ./proc/search.sql

echo 'Load trigger'
mysql -u $1 -p $2  < ./trigger/rate_check.sql
mysql -u $1 -p $2  < ./trigger/user.sql

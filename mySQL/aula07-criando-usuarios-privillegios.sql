
#usuario dba
CREATE USER 'admin01'@'localhost' IDENTIFIED BY 'admin01';
GRANT ALL PRIVILEGES ON *.* TO 'admin01'@'localhost' WITH GRANT OPTION;
DROP USER 'admin01'@'localhost';

#usuario normal
CREATE USER 'user01'@'localhost' IDENTIFIED BY 'user01';
GRANT SELECT , INSERT, UPDATE, DELETE ON *.* TO 'user01'@'localhost';

#usuario leitura
CREATE USER 'read01'@'localhost' IDENTIFIED BY 'read01';
GRANT SELECT ON *.* TO 'read01'@'localhost';

#select na tabela de usuários
SELECT * FROM mysql.user;
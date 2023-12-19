DROP DATABASE IF EXISTS lv6;
CREATE DATABASE lv6;
USE lv6;

CREATE TABLE temperatura(
	id INT PRIMARY KEY AUTO_INCREMENT,
    datum DATETIME NOT NULL,
    vrijednost INT NOT NULL
);

INSERT INTO temperatura (datum, vrijednost)
VALUES ('2023-10-10 6:50:43','23'),
	('2023-10-11 6:45:25','20'),
    ('2023-10-12 7:45:30','22'),
    ('2023-10-13 2:34:50','18');
    
CREATE TABLE ovlasti (
	id INT PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(100)
);

INSERT INTO ovlasti (naziv)
VALUES ('Administrator'),
	('Korisnik');




    
#LV7

DROP USER IF EXISTS app;
CREATE USER app@'%' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE, DELETE ON lv6.* TO app@'%';


CREATE TABLE korisnik(
	id INT PRIMARY KEY AUTO_INCREMENT,
ime CHAR(50) NOT NULL,
prezime CHAR(50) NOT NULL,
username VARCHAR(50) NOT NULL,
password BINARY(32) NOT NULL,
id_ovlasti INT,
FOREIGN KEY (id_ovlasti) REFERENCES ovlasti(id) ON UPDATE CASCADE ON DELETE SET NULL
);



INSERT INTO korisnik (ime, prezime, username, password, id_ovlasti) VALUES
('Ladislav', 'Kovač', 'lkovac', UNHEX(SHA2('1234', 256)), 1),
('Valentina', 'Ilić', 'vilic', UNHEX(SHA2('abcd', 256)), 1),
('Danko', 'Kovac', 'dkovac', UNHEX(SHA2('ab12', 256)), 2),
('Katija', 'Kolar', 'kkolar', UNHEX(SHA2('12ab', 256)), 2);
SELECT * FROM korisnik WHERE password = UNHEX(SHA2('1234', 256)) OR username = 'lkovac';

CREATE TABLE korisnikove_temperature (
	id_korisnika INT,
    id_temperature INT,
    FOREIGN KEY (id_korisnika) REFERENCES korisnik (id),
    FOREIGN KEY (id_temperature) REFERENCES temperatura (id)
);

INSERT INTO korisnikove_temperature (id_korisnika, id_temperature)
VALUES ('1','1'),
	('2','1'),
    ('1','2'),
    ('2','2'),
    ('1','3');

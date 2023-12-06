CREATE DATABASE lv6;
USE lv6;

CREATE TABLE temperatura(
	id INT PRIMARY KEY AUTO_INCREMENT,
    datum DATE,
    vrijednost INT
);

INSERT INTO temperatura (datum, vrijednost)
VALUES ('2023-10-10','23'),
	('2023-10-11','20'),
    ('2023-10-12','22'),
    ('2023-10-13','18');
    
CREATE TABLE ovlasti (
	id INT PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(100)
);

INSERT INTO ovlasti (naziv)
VALUES ('Administrator'),
	('Korisnik');

CREATE TABLE korisnik (
	id INT PRIMARY KEY AUTO_INCREMENT,
    ime CHAR(50),
    prezime CHAR(50),
    username VARCHAR(50),
    password VARCHAR(50),
    id_ovlasti INT, 
    FOREIGN KEY (id_ovlasti) REFERENCES ovlasti (id) 
);

INSERT INTO korisnik (ime, prezime, username, password, id_ovlasti)
VALUES ('Ladislav','Kovač','lkovac','1234','1'),
	('Valentina','Ilić','vilic','abcd','1'),
    ('Danko','Kovac','dkovac','ab12','2'),
    ('Katija','Kolar','kkolar','12ab','2'),
    ('Ladislav','Kovač','lkovac','1234','1'),
	('Valentina','Ilić','vilic','abcd','1');

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
	
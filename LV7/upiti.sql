SELECT * FROM temperatura;
SELECT * FROM temperatura ORDER BY id DESC LIMIT 1;

SELECT * FROM ovlasti;
SELECT * FROM korisnik;

SELECT ime, prezime, naziv FROM korisnik
INNER JOIN ovlasti ON korisnik.id_ovlasti = ovlasti.id;
SELECT * FROM korisnik WHERE username = 'kkolar' OR password = '12ab';

SELECT * FROM korisnikove_temperature;

SELECT ime, prezime, vrijednost FROM korisnik
LEFT JOIN korisnikove_temperature ON korisnikove_temperature.id_korisnika = korisnik.id
LEFT JOIN temperatura ON temperatura.id = korisnikove_temperature.id_temperature
WHERE korisnik.id = 1;
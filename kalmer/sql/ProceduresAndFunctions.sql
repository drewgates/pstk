-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Loomise aeg: Veebr 07, 2015 kell 01:21 PL
-- Serveri versioon: 5.6.16
-- PHP versioon: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Andmebaas: `people`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `Persons`
--

CREATE TABLE IF NOT EXISTS `Persons` (
  `PD_ID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Firstname` tinytext NOT NULL,
  `Lastname` tinytext NOT NULL,
  `Phone_Nr` bigint(8) NOT NULL,
  `Birthday` date NOT NULL,
  `Salary` float(7,2) unsigned NOT NULL,
  `Hometown` varchar(100) NOT NULL,
  `E-Mail` varchar(30) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  PRIMARY KEY (`PD_ID`),
  UNIQUE KEY `PD_ID_UNIQUE` (`PD_ID`),
  UNIQUE KEY `PhoneNr_UNIQUE` (`Phone_Nr`),
  UNIQUE KEY `E-Mail_UNIQUE` (`E-Mail`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Andmete tõmmistamine tabelile `Persons`
--

INSERT INTO `Persons` (`PD_ID`, `Firstname`, `Lastname`, `Phone_Nr`, `Birthday`, `Salary`, `Hometown`, `E-Mail`, `Gender`) VALUES
(1, 'Mati', 'Saar', 55487941, '1990-02-02', 1050.00, 'Viljandi', 'mati.saar.90@gmail.com', 'Male'),
(2, 'Laura', 'Siiri', 51459874, '1987-11-03', 998.56, 'Paide', 'laura.siiri@gmail.com', 'Female'),
(3, 'Mihkel', 'Latikas', 51777874, '1988-10-18', 1998.56, 'Paide', 'mihkelmihkell123@gmail.com', 'Male'),
(4, 'Milvi', 'Lihtne', 59005487, '1956-01-05', 1290.00, 'Tapa', 'milvilihtne56@gmail.com', 'Female'),
(5, 'Sander', 'Suur', 51145698, '1975-02-02', 920.50, 'Kunda', 'suursander.123@yahoo.com', 'Male'),
(6, 'Pille', 'Väike', 51005698, '1982-03-22', 990.10, 'Kunda', 'pillepille822@yahoo.com', 'Female');

-- Päringud --
-- Mehed, kes on sündinud peale 1980 aastat --
SELECT Firstname, Lastname from persons where gender = "Male" and year(Birthday) > 1980;

-- Naiste palgad kokku --
SELECT count(Firstname) as `Töötajate arv kokku`, sum(salary) as `Palgad kokku` from persons where gender = "Female";

-- Linnade kaupa keskmised palgad --
SELECT avg(salary), hometown from persons group by hometown;

-- Vanimad inimesed soo alusel Kundast --
SELECT min(Birthday), Firstname from persons where hometown = "Kunda" group by gender;

-- Palkdade erinevus ümardatult ja soo alusel --
SELECT round(stddev(Salary)) as `Palkade erinevus` from persons group by gender;




-- Protseduurid --

-- PROTSEDUUR 1 -- 
-- Protseduur, mis valib tablelist protseduurid maksimum palga --


DELIMITER // -- DELIMITER muudab käsku lõpetavat märki, mis tavaliselt on ";".
CREATE PROCEDURE maxSalary (OUT param1 INT) -- Protseduur nõuab tüüpi: IN, OUT või INOUT, vähemalt üht muutujat: param1 ja selle andmetüüpi: INT
BEGIN -- Protseduuri algus.  
SELECT MAX(Salary) INTO param1 FROM persons;  -- SQL päring, mis valib maximum palga tabelist persons ja sisestab algsesse muutujasse param1.
END// -- Protseduuri lõpp. NB! Semikooloni asemel lõpetab käsu //

DELIMITER ; -- DELIMITER muudab käsku lõpetava märgi tagasi semikooloniks.

CALL maxSalary (@a); -- CALL kutsub loodud protseduuri välja, sulgudesse uus muutuja, mis ühtlasi on ka veeru nimi.
SELECT @a; -- SQL päring kuvab tabelina protseduuri tulemuse. 

-- TULEMUS: --
+------+
| @a   |
+------+
| 1999 |
+------+


-- PROTSEDUUR 2 --

DELIMITER // 

CREATE procedure CalcIncome ( OUT ending_value INT )

BEGIN 
   DECLARE income INT; -- Muutuja loomine protseduuri sees.
   SET income = 50;		-- Muutujale väärtuse andmine.
   label1: WHILE income <= 3000 DO -- label1: WHILE tsükli nimetus (valikuline)
     SET income = income * 2; -- DO SET muudab muutuja väärtust 
   END WHILE label1;		-- WHILE tsükli lõpp
   SET ending_value = income; -- Korrutise tulemus võrdne väljastatava muutujaga. 
END; // -- Protseduuri lõpp

DELIMITER ;

CALL CalcIncome (@variable_name);
SELECT @variable_name;

-- TULEMUS: -- 
+----------------+
| @variable_name |
+----------------+
|           3200 |
+----------------+



-- FUNTSIOONID --

-- FUNKTSIOON 1 --

CREATE FUNCTION hello (word CHAR (20)) -- Funktsiooni loomine, sulgudes muuutuja ja andmetüüp. Võib olla ka rohkem neid. 
RETURNS CHAR(50) -- Tagastatava väärtuse andmetüüp
DETERMINISTIC -- Vaikimisi NOTDETERMINISTIC ehk muutuva väärtusega näiteks, kui kasutada now() funktsiooni loodud funktsiooni sees. DETERMINISTIC - muutumatu väärtusega.
RETURN CONCAT('Hello, ', word, '!'); -- Funktsiooni poolt väljastatav tulemus.
									-- CONCAT funktsioon liidab kaks stringi üheks. 	

SELECT hello('world') AS MESSAGE; -- Funktsiooni välja kutsumine --

-- TULEMUS: --
+---------------+
| Message       |
+---------------+
| Hello, world! |
+---------------+




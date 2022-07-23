-- Using MySQL Workbench
-- Create DB
CREATE DATABASE IF NOT EXISTS Movies;

USE Movies;

-- Create tables
CREATE TABLE IF NOT EXISTS MOVIE (
    TITLE VARCHAR(255) NOT NULL,    
    YEAR INTEGER NOT NULL,
    LENGTH INTEGER,
    INCOLOR CHAR(1),
    STUDIONAME CHAR(50),
    PRODUCERC INTEGER
);

CREATE TABLE IF NOT EXISTS MOVIESTAR (
    NAME CHAR(30) NOT NULL,
    ADDRESS VARCHAR(255),
    GENDER CHAR(1),
    BIRTHDATE DATETIME
);

CREATE TABLE IF NOT EXISTS STARSIN (
    MOVIETITLE VARCHAR(255) NOT NULL,
    MOVIEYEAR INTEGER NOT NULL,
    STARNAME CHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS MOVIEEXEC (
	CERT INTEGER NOT NULL,
    NAME CHAR(30),
    ADDRESS VARCHAR(255),
    NETWORTH INTEGER
);

CREATE TABLE IF NOT EXISTS STUDIO (
    NAME CHAR(50) NOT NULL,
    ADDRESS VARCHAR(255),
    PRESC INTEGER
);

-- Create constraints
ALTER TABLE MOVIE ADD CONSTRAINT PK_MOVIE PRIMARY KEY (TITLE, YEAR);
ALTER TABLE MOVIESTAR ADD CONSTRAINT PK_MOVIESTAR PRIMARY KEY (NAME);
ALTER TABLE MOVIEEXEC ADD CONSTRAINT PK_MOVIEEXEC PRIMARY KEY (CERT);
ALTER TABLE STUDIO ADD CONSTRAINT PK_STUDIO PRIMARY KEY (NAME);
ALTER TABLE STARSIN ADD CONSTRAINT PK_STARSIN PRIMARY KEY( MOVIETITLE, MOVIEYEAR, STARNAME);
ALTER TABLE MOVIE ADD CONSTRAINT FK_MOVIE_MOVIEEXEC FOREIGN KEY (PRODUCERC) REFERENCES MOVIEEXEC (CERT);
ALTER TABLE MOVIE ADD CONSTRAINT FK_MOVIE_STUDIO FOREIGN KEY (STUDIONAME) REFERENCES STUDIO (NAME);
ALTER TABLE STARSIN ADD CONSTRAINT FK_STARSIN_MOVIE FOREIGN KEY (MOVIETITLE, MOVIEYEAR) REFERENCES MOVIE (TITLE, YEAR);
ALTER TABLE STARSIN ADD CONSTRAINT FK_STARSIN_MOVIESTAR FOREIGN KEY (STARNAME) REFERENCES MOVIESTAR (NAME);

-- Insert Studios
INSERT INTO STUDIO VALUES ('Disney','500 S. Buena Vista Street',1);
INSERT INTO STUDIO VALUES ('USA Entertainm.','', 2);
INSERT INTO STUDIO VALUES ('Fox','10201 Pico Boulevard', 3);
INSERT INTO STUDIO VALUES ('Paramount','5555 Melrose Ave', 4);
INSERT INTO STUDIO VALUES ('MGM','MGM Boulevard', 5);

-- Insert MovieExecs 
INSERT INTO MOVIEEXEC (NAME, ADDRESS, CERT, NETWORTH) VALUES ('George Lucas', 'Oak Rd.', 555, 200000000);
INSERT INTO MOVIEEXEC (NAME, ADDRESS, CERT, NETWORTH) VALUES ('Ted Turner', 'Turner Av.', 333, 125000000);
INSERT INTO MOVIEEXEC (NAME, ADDRESS, CERT, NETWORTH) VALUES ('Stephen Spielberg', '123 ET road', 222, 100000000);
INSERT INTO MOVIEEXEC (NAME, ADDRESS, CERT, NETWORTH) VALUES ('Merv Griffin', 'Riot Rd.', 199, 112000000);
INSERT INTO MOVIEEXEC (NAME, ADDRESS, CERT, NETWORTH) VALUES ('Calvin Coolidge', 'Fast Lane', 123, 20000000);

-- Insert Movies
INSERT INTO MOVIE VALUES ('Pretty Woman', 1990, 119, 'Y', 'Disney', 199);
INSERT INTO MOVIE VALUES ('The Man Who Wasn''t There', 2001, 116, 'N', 'USA Entertainm.', 555);
INSERT INTO MOVIE VALUES ('Logan''s run', 1976, NULL, 'Y', 'Fox', 333);
INSERT INTO MOVIE VALUES ('Star Wars', 1977, 124, 'Y', 'Fox', 555);
INSERT INTO MOVIE VALUES ('Empire Strikes Back', 1980, 111, 'Y', 'Fox', 555);
INSERT INTO MOVIE VALUES ('Star Trek', 1979, 132, 'Y', 'Paramount', 222);
INSERT INTO MOVIE VALUES ('Star Trek: Nemesis', 2002, 116, 'Y', 'Paramount', 123);
INSERT INTO MOVIE VALUES ('Terms of Endearment', 1983, 132, 'Y', 'MGM', 123);
INSERT INTO MOVIE VALUES ('The Usual Suspects', 1995, 106, 'Y', 'MGM', 199);
INSERT INTO MOVIE VALUES ('Gone With the Wind', 1938, 238, 'Y', 'MGM', 123);

-- Insert MovieStar
INSERT INTO MOVIESTAR VALUES ('Jane Fonda', 'Turner Av.', 'F', '1977-07-07');
INSERT INTO MOVIESTAR VALUES ('Alec Baldwin', 'Baldwin Av.', 'M', '1977-07-06');
INSERT INTO MOVIESTAR VALUES ('Kim Basinger', 'Baldwin Av.', 'F', '1979-07-05');
INSERT INTO MOVIESTAR VALUES ('Harrison Ford', 'Prefect Rd.', 'M', '1955-05-05');
INSERT INTO MOVIESTAR VALUES ('Debra Winger', 'A way', 'F', '1978-06-05');
INSERT INTO MOVIESTAR VALUES ('Jack Nicholson', 'X path', 'M', '1949-05-05');
INSERT INTO MOVIESTAR VALUES ('Sandra Bullock', 'X path', 'F', '1948-12-05');

-- Insert StarsIn
INSERT INTO STARSIN VALUES ('Star Wars', 1977, 'Kim Basinger');
INSERT INTO STARSIN VALUES ('Star Wars', 1977, 'Alec Baldwin');
INSERT INTO STARSIN VALUES ('Star Wars', 1977, 'Harrison Ford');
INSERT INTO STARSIN VALUES ('Empire Strikes Back', 1980, 'Harrison Ford');
INSERT INTO STARSIN VALUES ('The Usual Suspects', 1995, 'Jack Nicholson');
INSERT INTO STARSIN VALUES ('Terms of Endearment', 1983, 'Jane Fonda');
INSERT INTO STARSIN VALUES ('Terms of Endearment', 1983, 'Jack Nicholson');
INSERT INTO NNN VALUES ('The Usual Suspects', 1995, 'Sandra Bullock');
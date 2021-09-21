-- SELECTS

-- Einzeltabellen
SELECT * FROM mydb.cats;
SELECT * FROM mydb.servants;

-- Kreuzprodukt (Kartesisches Produkt)
SELECT * FROM mydb.cats JOIN mydb.servants;

-- Inner Join 1 / Gesamte Tabelle
SELECT
	*
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
;

-- Inner Join 2 / (Wer dient wem?)
-- Wer dient Grizabella?
-- Wem dient Fatih?
SELECT
	cat_name AS Katze,
    servant_name Diener
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
-- Filtern mit WHERE
#WHERE cat_name = "Grizabella"
WHERE servant_name = "Fatih"
;

-- Inner Join 2a / (Wer dient wem?)
-- "X ist der Diener von Y"  / Dienstverhältnis
SELECT
	concat(servant_name, " ist der Diener von ", cat_name,".") AS Dienstverhältnis
FROM mydb.cats INNER JOIN mydb.servants
ON cats.id = servants.cats_id
#WHERE etc.
;

-- Inner Join 2a / (Wer dient wem?)
-- "X ist der Diener von Y"  / Dienstverhältnis
SELECT
	concat(servant_name, " ist der Diener von ", cat_name,".") AS Dienstverhältnis
FROM mydb.cats INNER JOIN mydb.servants
ON cats.id = servants.cats_id
#WHERE cat_name = "Grizabella"
WHERE servant_name = "Holger"
;

-- Inner Join 3 / Dienstzeit
SELECT
	servant_name Diener,
    yrs_served AS Dienstzeit
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
;

-- Inner Join 4 / Dienstzeit 
-- "X - der Diener von Y - ist der Diener mit der längsten Dienstzeit" // MAX()


SELECT elofizeto.nev, utca, hazszam, lap.cim
FROM lap, elofizeto, elofizetes
WHERE elofizeto.id = elofizetes.eloid AND lap.id = elofizetes.lapid
	AND eloid Not IN ( … )

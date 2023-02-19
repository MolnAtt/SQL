# Tartalomjegyzék
- [IN](#in-beágyazás-szűrésbe)
- [Metszet](#metszet)
- [Különbség](#különbség)
- [Unió](#union)

# Halmazműveletek
## ``IN``: beágyazás szűrésbe
Az ``IN`` predikátum, amely azt vizsgálja meg, hogy egy rekord szerepel-e egy táblában/beágyazott lekérdezésben. 

```sql
SELECT ...
FROM ...
WHERE ... IN (SELECT ...);
```
## Metszet
Két halmaz metszete nem más, mint azon egyik halmazbeli halmaz elemei, amelyek a másik halmazban is fellelhetők:
$$ A\cap B \overset{\mathrm{def}}{\iff} \{ x\in A :  x\in B \} $$
Erre épül a két tábla metszetét alkotó lekérdezés sql-lekérdezése is:
```sql
SELECT X
FROM A
WHERE X IN B;
```

Megjegyezzük, hogy bizonyos adatbázis-kezelőkben (*MS Access nem tartozik ide!*) van erre külön lekérdezéseken értelmezett művelet is: 

```sql
SELECT ...

INTERSECT

SELECT ...;
```


## Különbség
Két halmaz különbsége nem más, mint azon egyik halmazbeli halmaz elemei, amelyek a másik halmazban nem lelhetők fel:

$$ A\setminus B \overset{\mathrm{def}}{\iff} \{ x\in A :  x\notin B \} $$
Erre épül a két tábla metszetét alkotó lekérdezés sql-lekérdezése is:


```sql
SELECT X
FROM A
WHERE X NOT IN B;
```

## ``UNION``
Két halmaz uniója azon elemekből áll, amelyek egyikben vagy másikban fellelhetők:
$$ A\cup B \overset{\mathrm{def}}{\iff} \{ x: x\in A \lor x\in B \} $$
Erre nagyon körülményes SQL-lekérdezést írni, de van kifejezetten egy lekérdezésekre értelmezett kétváltozós művelet, amely még az MS Access-ben is elérhető:

```sql
SELECT ...

UNION

SELECT ...;
```


# Tartalomjegyzék
- [SELECT](#select)
- [SELECT mezo](#select-mezo)
- [SELECT mezo1, mezo2](#select-mezo1-mezo2)
- [SELECT f(mezo)](#select-fmezo)
- [SELECT COUNT(...)](#select-count)
- [SELECT MAX(...)](#select-max)
- [SELECT SUM(...)](#select-sum)
- [SELECT AVG(...)](#select-avg)
- [SELECT TOP ...](#select-top---select-limit)
- [SELECT DISTINCT ...](#select-distinct)

# ``SELECT``
Egy táblában a legalapvetőbb lekérdezés, ami minden más lekérdezés kiindulópontjaként is szolgál, a következő: 
```sql
SELECT *
FROM J;
```
Ez a lekérdezés nem csinál mást, mint visszaadja az eredeti táblát. 

A **SELECT** után következő rész arra szolgál, hogy megmondjuk, **a tábla mely oszlopaival mi történjen**. 

A ``*`` azt jelenti, hogy jelenjen meg mindegyik. 

Jótanács: A feladatok megoldása során ameddig csak lehet, érdemes a ``*``-ot szerepeltetni, és csak akkor eltünteni, amikor már nem lehet enélkül továbbfejleszteni az sql-kódot vagy ez hiányzik már csak a helyes megoldáshoz. 

## ``Select mezo``
A ``Select`` alkalmas arra, hogy a táblából elhagyjunk sorokat. Ilyenkor a szerepeltetni kívánt oszlopokat felsoroljuk a ``Select`` után. 

A következő lekérdezés előállítja az osztálynévsort:
```sql
SELECT nev
FROM J;
```
Ennek eredménye:

```...```

## ``SELECT mezo1, mezo2``
Vesszővel elválasztva több oszlopot is meg lehet adni. Ilyenkor a megadott sorrendben sorolja fel az oszlopokat.
```sql
SELECT nev, szulev
FROM J;
```
## ``SELECT f(mezo)``
### Matek
A ``SELECT`` valójában arra szolgál, hogy az eredeti tábla rekordjain ("sorain") különböző operációkat hajtsunk végre. 
> A fentiek során például ún. *projekciókat* láthattunk: 

> **Definíció.** (*projekció*)
> $i$-edik projekciónak nevezzük azon rendezett $n$-eseken > értelmezett $f$ függvényeket, amelyekre:
>
> $$ f_i (x_1, ..., x_i, ..., x_n)  = x_i$$


Tehát egy rendezett $n$-eshez hozzárendeltük az egyik tagját, és az eszerinti képek alkotta tábla volt az eredmény. 

> **Definíció.** (*függvény szerinti kép*)
> Adott egy $f:D\to R$ függvény. Egy $H\subseteq D$ halmaz esetén az $H$ halmaz $f$ függvény szerinti képe alatt azon $f(x)$ elemek halmazát értjük, amelyekre $x\in H$. 
>
> $$ f[H] \overset{\mathrm{def}}{=} \{f(x)\in R : x\in H \}$$



De valójában nem csak projekciófüggvények alkalmazhatók: **bármilyen olyan függvényt lehet használni, amely egy adott rekorddal tenne valamit.** Például van egy függvény, amely a dátumhoz hozzárendeli az évszámát mint számot, ez a ``YEAR`` függvény. A következő lekérdezés arra a kérdésre ad választ, hogy mely tanuló melyik évben született:

```sql
SELECT nev, YEAR(datum)
FROM J;
```

A következő pedig azt mutatja meg, hogy melyik tanuló hány olyan rokonnal él együtt, akik nem a testvérei: ugyanis az együttlakók számából kivonva a testvéreket és saját magát az egyéb rokonok száma marad. 

```sql
SELECT nev, egyuttlakok-testverek-1
FROM J;
```

### Műveletek
A következő függvények például használhatók hasonló módon arra, hogy egy $n$-rekordból álló táblából egy másik $n$ rekordból álló táblát kapjunk azáltal, hogy a megfelelő mezőkön elvégzett függvények képét vesszük:

- Konkatenáció: ``...&...``
- Összeadás: ``...+...``
- Kivonás: ``...-...``
- Szorzás: ``...*...``
- Osztás: ``.../...``
- Maradékos osztás maradéka: `` ... MOD ...``
- Maradékos osztás eredménye: `` ... DIV ...``
- Felső egészrész: ``CEILING(...)``
- Alsó egészrész: ``FLOOR(...)``
- Kerekítés: ``ROUND(...,...)`` (a második paraméter nem kötelező, a kerekítés mértékét szabályozza.)
- Abszolútérték: ``ABS(...)``
- Alapvető dátum-projekciók: ``YEAR(...)``, ``MONTH(...)``, ``DATE(...)``, ``HOUR(...)``, ``MINUTE(...)``, ``SECOND(...)``

A különböző adatbáziskezelők (MySQL, PostgreSQL, MSSQL, ...) általában nem különböznek nagyon az SQL parancsok értelmezésében. Azonban a fenti függvények pont azon kivételét alkotják a nyelveknek, amelyekben a különböző értelmezők jelentősen eltérhetnek. Ezért érdemes ezeknek néha utánanézni a házi feladatok megoldása közben is. 

### Összesítések

Összesítésnek nevezzük táblákon értelmezett, rekord értékű függvényeket. Nagyon leegyszerűsítve: Az összesítések olyan függvények, amelyek sok adatból csinálnak egyetlen adatot. 

#### ``SELECT COUNT(...)``
Az osztályhoz hozzárendeljük az osztálylétszámot. Azaz a J tábla $N$ db rekordjához hozzárendelünk 1 db természetes számot. Tehát itt:

$$ \mathsf{COUNT}:H^N\to \mathbb N$$

```sql
SELECT COUNT(*)
FROM J;
```
Itt ``COUNT(id)``-et is írhattunk volna, ennek nincs jelentősége.


Itt most fontos, hogy nem írhatunk csillagot az ``AVG``-be. Az előző példában mindegy volt, hogy a teljes sorokat számolja vagy az ``id``-et, de itt nem mindegy, hogy testvérszámot átlagol-e vagy mást -- a sorok esetében értelmezni sem tudja az összeadás műveletét...

#### ``SELECT MAX(...)``

Az osztályhoz hozzárendeljük a legidősebb tanuló korát.
Azaz a J tábla $N$ db rekordjához hozzárendelünk 1 db dátumot. Tehát itt:

$$ \mathsf{MAX}:H^N\to \mathbb{D} $$

```sql
SELECT MAX(szulido)
FROM J;
```

Természetesen létezik ``SELECT MIN(...)`` is. 
#### ``SELECT SUM(...)``


Az osztályhoz hozzárendeljük az együttlakók számának az összegét: 
Azaz a J tábla $N$ db rekordjához hozzárendelünk 1 db természetes számot. Tehát itt:

$$ \mathsf{SUM}:H^N\to \mathbb{N} $$

```sql
SELECT SUM(egyuttlakok)
FROM J;
```

#### ``SELECT AVG(...)``
Az osztályhoz hozzárendeljük az átlagos testvérszámot. 
Azaz a J tábla $N$ db rekordjához hozzárendelünk 1 db természetes számot. Tehát itt:

$$ \mathsf{AVG}:H^N\to \mathbb R $$

```sql
SELECT AVG(testverszam)
FROM J;
```

## Rekordok szűrése ``SELECT``-en keresztül
### ``SELECT TOP ... `` / ``SELECT LIMIT ...``


Lehetőség van arra, hogy rekordok mentén is korlátozzuk a táblát, ne csak mezők mentén. A következő lekérdezés csak az első három rekordot mutatja a listában:

```sql
SELECT TOP 3 *
FROM J;
```

Fontos, hogy MSAccessben, ha egy adott mező szerint kérünk három elemet, ahol "holtverseny" fordul elő, akkor mindegyiket megmutatja, akkor is, ha így átlépi a hármat.

### ``SELECT DISTINCT ... ``
A ``DISTINCT`` parancs hatására az ismétlődő rekordokat eltávolítja. Pl. a következő parancs megmutatja, hogy milyen angolcsoportok vannak egyáltalán: 

```sql
SELECT DISTINCT angol
FROM J;
```

# DQL: Data Query Language
## Tartalomjegyzék
- [Alapok](#alapok)
- [Egytáblás lekérdezések](#egytáblás-lekérdezések)
    - [J - példa-adatbázis szerkezete](#j-példa-adatbázis-szerkezete)
    - [SELECT és FROM](#select-és-from)
        - [FROM](#from)
        - [SELECT *](#select-*)
        - [SELECT mezo](#select-mezo)
        - [SELECT mezo1, mezo2](#select-mezo1-mezo2)
        - [SELECT f(mezo)](#select-fmezo)
            - [Függvények szerinti képek](#függvények-szerinti-képek)
            - [Összesítések](#összesítések)
        - [Rekordok szűrése](#rekordok-szűrése-select-tel)
            - [SELECT TOP](#select-top---select-limit)
            - [SELECT DISTINCT](#select-distinct)
    - [WHERE](#where)
        - [WHERE ... LIKE ...](#where---like)
- [Többtáblás lekérdezések](#többtáblás-lekérdezések)

## Alapok
Egy **elemi lekérdezés** minimális szerkezete a következő:
```sql
SELECT ...
FROM ... ;
```
Maximális szerkezete pedig: 
```sql
SELECT ...
FROM ...
WHERE ...
GROUP BY ...
HAVING ...
ORDER BY ... ;
```

A ``WHERE``, ``GROUP BY``, ``HAVING``, ``ORDER BY`` parancsok tehát nem kötelező összetevői egy DQL utasításnak. Ha viszont előfordulnak, akkor **egymáshoz viszonyított sorrendjük mindig ez kell legyen!**

**Az utasításokat mindig pontosvessző (``;``) zárja.** Egyes adatbáziskezelők (pl. MS Access) kiteszik az elhagyott ``;``-ket a sor végén. 

Az SQL-interpreterek nem érzékenyek arra, hogy ezek a szavak **nagybetűvel legyenek szedve**, de illik erre odafigyelni. (Hajdanán a HTML tag-eket is illett nagybetűvel szedni, de azóta ez a szokás ott már eltűnt.)

**A whitespace-eknek (szóköz, tab, sortörés) jelentősége nincs.** Az értelmező ezeket figyelmen kívül hagyja, az első pontosvesszőig olvas mindent, mielőtt megpróbálja az utasítást végrehajtani.


## Egytáblás lekérdezések
### J: példa-adatbázis szerkezete
A következőkben feltesszük, hogy az olvasó már képes táblát létrehozni (DDL), és rendelkezésre áll a 3000J feladat adatbázisa. Ennek az adatbáziskezelésre átalakított nyers .csv (comma separated value) fájlja itt található meg: [J.csv](J.csv).

A továbbiakban feltesszük, hogy a tábla neve ``J``, a mezők nevei a fájl első sorában lévő értékeknek felelnek meg, azaz: 
- ``id``: szám, ez az elsődleges kulcs.
- ``nev``: szöveg.
- ``matinfo``: szöveg.
- ``angol``: szöveg.
- ``nyelv2``: szöveg.
- ``nem``: logikai.
- ``egyuttlakok``: szám.
- ``testverek``: szám.
- ``szulido``: dátum.

### ``SELECT`` és ``FROM``
#### ``FROM``
A következőkben végig egytáblás lekérdésekkel, a ``J`` táblával dolgozunk, így a legtöbb lekérdezésünk mindig ezt fogja tartalmazni: ``FROM J``. A ``FROM`` klauzulának főleg a többtáblás lekérdezések esetében és a lekérdezések egymásba ágyazása során van szerepe, így ezt most egyelőre nem tárgyaljuk mélyebben. 
#### ``SELECT *``
A legalapvetőbb lekérdezés, ami minden más lekérdezés kiindulópontjaként is szolgál, a következő: 
```sql
SELECT *
FROM J;
```
Ez a lekérdezés nem csinál mást, mint visszaadja az eredeti táblát. 

A **SELECT** után következő rész arra szolgál, hogy megmondjuk, **a tábla mely oszlopaival mi történjen**. 

A ``*`` azt jelenti, hogy jelenjen meg mindegyik. 

Jótanács: A feladatok megoldása során ameddig csak lehet, érdemes a ``*``-ot szerepeltetni, és csak akkor eltünteni, amikor már nem lehet enélkül továbbfejleszteni az sql-kódot vagy ez hiányzik már csak a helyes megoldáshoz. 

#### ``Select mezo``
A ``Select`` alkalmas arra, hogy a táblából elhagyjunk sorokat. Ilyenkor a szerepeltetni kívánt oszlopokat felsoroljuk a ``Select`` után. 

A következő lekérdezés előállítja az osztálynévsort:
```sql
SELECT nev
FROM J;
```
Ennek eredménye:

```...```

#### ``SELECT mezo1, mezo2``
Vesszővel elválasztva több oszlopot is meg lehet adni. Ilyenkor a megadott sorrendben sorolja fel az oszlopokat.
```sql
SELECT nev, szulev
FROM J;
```
#### ``SELECT f(mezo)``
##### Függvények szerinti képek
A ``SELECT`` valójában arra szolgál, hogy az eredeti tábla rekordjain ("sorain") különböző operációkat hajtsunk végre. A fentiek során például projekciókat láthattunk: egy rendezett $n$-eshez hozzárendeltük az egyik tagját, és az eszerinti képek alkotta tábla volt az eredmény. 

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

##### Összesítések

Összesítésnek nevezzük táblákon értelmezett, rekord értékű függvényeket. Nagyon leegyszerűsítve: Az összesítések olyan függvények, amelyek sok adatból csinálnak egyetlen adatot. 

Példák: 
- ``COUNT``: Az osztályhoz hozzárendeljük az osztálylétszámot. Azaz a J tábla $N$ db rekordjához hozzárendelünk 1 db természetes számot. Tehát itt:

$$ \mathsf{COUNT}:H^N\to \mathbb N$$

```sql
SELECT COUNT(*)
FROM J;
```
Itt ``COUNT(id)``-et is írhattunk volna, ennek nincs jelentősége.

- ``AVG``: Az osztályhoz hozzárendeljük az átlagos testvérszámot. 
Azaz a J tábla $N$ db rekordjához hozzárendelünk 1 db természetes számot. Tehát itt:
$$ \mathsf{AVG}:H^N\to \mathbb R $$
```sql
SELECT AVG(testverszam)
FROM J;
```
Itt most fontos, hogy nem írhatunk csillagot az ``AVG``-be. Az előző példában mindegy volt, hogy a teljes sorokat számolja vagy az ``id``-et, de itt nem mindegy, hogy testvérszámot átlagol-e vagy mást -- a sorok esetében értelmezni sem tudja az összeadás műveletét...

- ``MAX``:Az osztályhoz hozzárendeljük a legidősebb tanuló korát.
Azaz a J tábla $N$ db rekordjához hozzárendelünk 1 db dátumot. Tehát itt:
$$ \mathsf{MAX}:H^N\to \mathbb{D} $$
```sql
SELECT MAX(szulido)
FROM J;
```
- ``SUM``: Az osztályhoz hozzárendeljük az együttlakók számának az összegét: 
Azaz a J tábla $N$ db rekordjához hozzárendelünk 1 db természetes számot. Tehát itt:
$$ \mathsf{SUM}:H^N\to \mathbb{N} $$
```sql
SELECT SUM(egyuttlakok)
FROM J;
```

#### Rekordok szűrése SELECT-tel
##### ``SELECT TOP ... `` / ``SELECT LIMIT ...``


Lehetőség van arra, hogy rekordok mentén is korlátozzuk a táblát, ne csak mezők mentén. A következő lekérdezés csak az első három rekordot mutatja a listában:

```sql
SELECT TOP 3 *
FROM J;
```

Fontos, hogy MSAccessben, ha egy adott mező szerint kérünk három elemet, ahol "holtverseny" fordul elő, akkor mindegyiket megmutatja, akkor is, ha így átlépi a hármat.

##### ``SELECT DISTINCT ... ``
A ``DISTINCT`` parancs hatására az ismétlődő rekordokat eltávolítja. Pl. a következő parancs megmutatja, hogy milyen angolcsoportok vannak egyáltalán: 

```sql
SELECT DISTINCT angol
FROM J;
```
### ``WHERE``
A rekordokat szűrni nem csak a lista elejének kiemelésével vagy az ismétlődések eltüntetésével lehet. **A ``WHERE`` a logikai értékű függvényekkel (predikátumokkal) való szűrésre szolgál.**

**FONTOS**: A WHERE mindig a FROM után helyezkedik el és csak egyetlen WHERE tag lehet egy lekérdezésben!

#### Predikátumok
Közismertebb predikátumok:
| Szimbólum  |   Leírás             |        Példa     |
|------------|----------------------|------------------|
| ... = ...  | azonosság            | nyelv2 = "orosz" |
| ... <> ... | különbözés           | nyelv2 <> "angol"|
| ... < ...  |   kisebb             | egyuttlakok < 3  |
| ... > ...  |   nagyobb            | egyuttlakok > 3  |
| ... <= ... | kisebb vagy egyenlő  | egyuttlakok <= 3 |
| ... >= ... | nagyobb vagy egyenlő | egyuttlakok >= 3 |
| ... <= ... | kisebb vagy egyenlő  | egyuttlakok <= 3 |
| ... BETWEEN ... AND ... | két érték között (zárt intervallum) | egyuttlakok BETWEEN 1 and 3 |




például a következő feltétel kiszűri a német nyelvet tanulókat:

```sql
SELECT *
FROM J
WHERE nyelv2 = "német";
```

Komplex szűrési feltételek is kifejezhetők a szokásos logikai műveletekkel (NOT, AND, OR). A következő példa azon ``német``-et vagy ``olasz``-t tanuló diákok rekordjait szűri ki, akik nem az ``alfa`` matematikai-informatikai csoportban vannak.

```sql
SELECT *
FROM J
WHERE (nyelv2 = "német" OR nyelv2 = "olasz") AND NOT matinfo = "alfa";
```

#### WHERE ... LIKE ...

Lehetséges ún. *wildcard*-okkal is szűrni. A következő lekérdezés azon rekordokat szűri ki, amelyek angolcsoportjában előfordul a "Kis" kifejezés

```sql
SELECT *
FROM J
WHERE angol LIKE "*Kis*";
```
Itt a ``*Kis*`` egy ún. keresőkifejezés, amelyben *wildcard*-ok segítik a keresést. 

A ``*`` azt jelenti, hogy az adott pozícióban bármilyen hosszú és bármilyen karakterből álló karaktersorozat előfordulhat. Tehát mivel a ``Kis`` szó előtt és után is előfordul a ``*``, így bármilyen olyan karaktersorozatra illeszkedni fog a keresőkifejezés, amely a ``Kis`` karakterhármast tartalmazza. Ez MSAccessre jellemző wildcard, máshol (oleDB, SQLServer) a ``%`` jel a használatos.

A ``?`` jel azt jelenti, hogy az adott pozícióban bármilyen karakter előfordulhat, de csak egyetlen egy karakter. Ez MSAccessre jellemző wildcard, máshol (oleDB, SQLServer) a ``_.`` jel a használatos. Tehát például a ``?. Kis*`` azt jelenti, hogy bármilyen karakterrel kezdődő, ponttal, szóközzel és ``Kis``-sel folytatódó jelsorozat illeszkedőnek számít. A ``LIKE`` függvény pedig pontosan azon rekordokra ad majd igazat, amelyeknél a wildcard illeszkedik a megadott mezőre.

| Szimbólum | Leírás | Példa|
|-----------|--------|------|
|\*| 0 vagy több tetszőleges karakter| "bl\*"-ra illeszkednek: "black", "blue", "blob"|
|?|Egyetlen tetszőleges karakter|	"h?t"-re illeszkednek: "hot", "hat", "hit"|
|[...]| Egyetlen karakter, ami bármi lehet a keretes zárójelek között. | "h[oa]t"-re illeszkedik "hot" és "hat" de "hit" nem.
|[!...]| Egyetlen karakter, ami bármi lehet, kivéve zárójelben szereplők. |"h[!oa]t"-ra illeszkedik "hit" de "hot" és "hat" nem.|
|[...-...] | Bármilyen karakter a megadott intervallumban| "[a-g]"-re illeszkedik "hat", "hit" de "hot" nem
|#| Egyetlen számjel. De csak számjel.| "2#5"-re illeszkedik bármelyik 2-vel kezdődő és 5-re végző háromjegyű szám

Megjegyzés: SQLServer-en, OLEDB-n stb. ezek a jelek mások!


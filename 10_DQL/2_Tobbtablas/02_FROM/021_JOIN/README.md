# Táblák összekapcsolása

Adatbáziskezelésben a táblák összekapcsolása alatt azt értjük, amikor két táblából egy új táblát készítünk olyan módon, hogy az egyik táblában rendelkezésre álló információval kiegészítjük a másik táblában lévő rekordokat. 

## Kulcsok
Ahhoz, hogy a rekordokat azonosíthassuk, kulcsokra vannak szükség. 
**Kulcsnak** nevezzük azon tulajdonságát egy rekordnak, amely a rekordot egyértelműen azonosítja.

### Egyszerű kulcs
A legtöbbször rendelkezésre áll egy olyan mező, amely minden rekordot egyértelműen beazonosítja (ezt leggyakrabban ``id``-val jelölik.), ilyenkor **egyszerű** kulcsról beszélünk. Habár könnyen lehet több egyszerű kulcs is egy táblázatban, pl. egy személyes adatokat tartalmazó adatbázisban név, igazolványszámok, stb. szokás mégis egy külön mezőt fenntartani az egyedi kulcsképzésre, hogy az egyedi azonosítás soha ne is sérülhessen. Ezt a kulcsnak szánt mezőt nevezik **elsődleges** kulcsnak és a leggyakrabban ``id``-vel jelölik. 

### Összetett kulcs
Előfordul gyakran olyan is, hogy nincs ilyen mező a táblában, viszont két mező együtt már egyértelműen azonosít bármely rekordot. Például vegyük az egyik leggyakoribb webes adatbáziselemet: 
- Adott a felhasználók táblája
- Adott a felhasználói csoportok táblája
- Adott egy tábla, amely megmondja, hogy mely felhasználó mely csoporthoz tartozik. (Ez külön tábla, mert előfordulhat, hogy egy felhasználó több csoporthoz is tartozhat.)

Ez a harmadik kapcsolótábla csak a két tábla id-jait fogja tartalmazni. Egyik oszlop sem egyszerű kulcs, hiszen egy felhasználó tartozhat több csoporthoz is és egy csoporthoz több felhasználó is tartozhat. **Viszont egyetlen id-pár sem szerepelhet kétszer**, mivel nincs értelme annak, hogy kétszer is szerepeltessünk a kapcsolótáblában egy felhasználó-csoport kapcsolatot. Tehát a két id együtt már kulcsként funkcionál. Ilyenkor mondjuk azt, hogy a két mező egy **összetett kulcsot** alkot. 

### Idegen kulcs vs. elsődleges kulcs
Van viszont értelme arról beszélni, hogy az imént említett kapcsolótáblában a mezők külön-külön is valamiféle kulcsok abban az értelemben, hogy ezek az értékek *elsődleges kulcsok egy másik táblában*. Azt mondjuk, hogy egy mező/terminus egy táblában **idegen kulcs**, ha egy **másik táblában elsődleges kulcs**.

## Táblakapcsolások a gyakorlatban.

Vegyük azt a feladatot a 3000J++ adatbázisból, hogy kiírjuk, hogy ki kit húzott. A hangsúly itt most azon van, hogy nem csak az id-ket írjuk ki, hanem a neveket is. 

Két módszer áll rendelkezésre táblák összekapcsolására: 

## ``FROM`` + ``WHERE``
Az egyik lehetséges módszer az, hogy vesszük a J saját magával vett direkt szorzatát -- itt minden lehetséges rekordpár szerepel majd. A lényeg az, hogy ami nekünk kell, az egy részhalmaza annak, amit a direkt szorzat előállít. Nekünk azok a sorok kellenek, ahol a ``J2.id`` és a ``J.huzottid`` megegyeznek: 
Amire szükségünk van, az a következő halmaz:

$$ \{ (x,y)\in J\times J : \mathrm{huzottid}(x) = \mathrm{id}(y) \}$$

Ennek a definíciónak a tükörfordítása a következő sql-lekérdezés:

```sql
SELECT *
FROM J as X, J as Y
WHERE X.huzottid = Y.id;
```

Általában is, ha adott két halmaz, $A$ és $B$, amelyben egy $A$-beli $a$ rekord idegen kulcsát az $\mathrm{id}(a)$ tulajdonság jelöli ki, egy $B$ táblában pedig rendelkezésre áll egy ottani idegen kulcs (A elsődleges kulcsa), amely $B$-beli $b$ elemekre $\mathrm{A\_id}(b)$ értéket rendel (és amely érték egyedi az $A$-ban), akkor a következő halmazt tekinthetük a két halmaz összekapcsolásának:

$$\{ (a,b) \in A\times B : \mathrm{id}(a) = \mathrm{A\_id}(b) \}$$

nincs garancia arra, hogy ez a halmaz pontosan annyi elemből álljon, mint bármelyik halmaz. Amennyiben egyes $A$-beli $a$-khoz nem kapcsolódik $B$-beli elem, úgy lehet kevesebb elem is, és amennyiben több $B$-beli $b$ is rendelkezik ugyanazon idegen kulcsokkal, akkor az összekapcsolt táblának több eleme is lehet!

A következő sql-lekérdezés felel meg a fenti definíciónak:
```sql
SELECT *
FROM A, B
WHERE A.id = B.A_id;
```


## ``FROM`` + ``INNER JOIN``

A fenti két lekérdezés úgy is leírható sql-ben, hogy a szűrési feltételek nem a ``WHERE``-ben, hanem azelőtt foglalnak helyet. Ezáltal fenntarthatjuk a helyet a ``WHERE``-ben a tényleges, nem táblakapcsolási szándékkal létrehozott szűréseknek.

```sql
SELECT 
FROM J AS X INNER JOIN J AS Y ON X.huzottid = Y.id;
```
Ezt több tábla esetén érdemes máshogy tagolni. 

## Melyiket érdemes inkább használni?
Az attól függ.
- A ``FROM`` + ``WHERE`` nagyon szépen áttekinthető akkor, amikor sok táblát köt össze az ember. A ``FROM`` + ``INNER JOIN`` féle összeköttetés már két tábla után elkezd áttekinthetetlenné válni, sok tábla esetén meg igazi rémálom.
- Viszont a ``FROM`` + ``INNER JOIN`` összeköttetés taglalása nem foglalja a ``WHERE``-ben a helyet. És mivel valójában nem is szűrésként gondolunk ezekre a kapcsolatokra, sokkal jobban kiugrik, amikor ezek után mégis szűrünk. Tehát a tényleges logikai lépések mégis jobban tudnak látszani ilyenkor -- azon az áron, hogy maguk az összeköttetések kissé áttekinthetetlenek. De érdemes ilyenkor nagyon szépen tagolni a kódot, mert azért sok mindent el lehet érni azzal is!

## Példa több táblás kapcsolásra
Például a következő lekérdezés azt tekinti át, hogy volt-e három olyan ember, akik körbehúzták egymást (és ha volt ilyen, akkor egy ilyen hármast csak egyszer jelenítsen meg):

### Direkt szorzat:
```sql
SELECT *
FROM J AS X, J AS Y, J AS Z 
WHERE X.huzottid = Y.id
  AND Y.huzottid = Z.id
  AND Z.huzottid = X.id
  AND X.id < Y.id 
  AND Y.id < Z.id;
```

### INNER JOIN: 
```sql
SELECT *
FROM J AS X 
    INNER JOIN (J AS Y 
    INNER JOIN  J AS Z 
        ON Y.huzottid = Z.id) -- a zárójel nagyon fontos!
        ON X.huzottid = Y.id
WHERE Z.huzottid = X.id
  AND X.id < Y.id 
  AND Y.id < Z.id;
```
Itt a szigorú ``<`` oldja meg azt, hogy a hármas ne szerepeljen az összes lehetséges sorrendben. Id szerint növekvő sorrend csak egy lehetséges permutáció van, azt fogja megjeleníteni.
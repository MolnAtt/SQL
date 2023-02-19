# Lekérdezések beágyazásai
- [Értékek helyére](#beágyazás-értékek-helyére)
- [Táblák helyére](#beágyazás-táblák-helyére)
    - [Példa: "Hányféle"-feladatok](#hányféle-feladatok)
## Beágyazás értékek helyére

A ``WHERE`` klauzulában a szűrési feltételekben [eddig](#predikátumok) [mindig](#where--like) konstans értékek szerepeltek. Lehetséges azonban olyan értékeket is szerepeltetni, amelyek az adatbázis tartalmától függenek. A legtipikusabb példája ennek a maximumkeresés:

Keressük a legidősebb tanuló **nevét**!

A legidősebb tanuló születési ideje a következő:

```sql
SELECT MIN(szulido)
FROM J;
```

Ha viszont e születési idővel rendelkező tanuló neve a kérdés, akkor elő kéne keríteni azt a (vagy legalábbis az első olyan) rekordot a táblázatban, ahol ez a születési idő szerepel, és az ő nevét kiírni.

Ha ez a kor konstans lenne, ``#2005-11-17#``, akkor így lehetne megtalálni a gazdáját:

```sql
SELECT *
FROM J
WHERE szulido = #2005-11-17#;
```

Viszont ez az érték ugye most az adatbázis tartalmától függ. 
A két lekérdezés komponálható:

```sql
SELECT *
FROM J
WHERE szulido = (SELECT MIN(szulido) FROM J);
```

Vagy máshogy tördelve: 

```sql
SELECT *
FROM J
WHERE szulido = (
    SELECT MIN(szulido)
    FROM J
    );
```

**Ez tehát akkor és csak akkor működik, ha a beágyazott lekérdezés eredménye egyetlen rekord egyetlen oszlopa!** Próbáljuk ki bátran, mi van, ha több oszlopot ad vissza a beágyazott lekérdezés vagy nem csak egyetlen sorból áll. Nem fog működni.

> Arra figyeljünk, hogy a beágyazott lekérdezést nem zárja pontosvessző!

## Beágyazás táblák helyére
Eddig a ``FROM`` után mindig a ``J`` tábla neve szerepelt. Valójában azonban lehet más lekérdezéseket is szerepeltetni itt. 

Mindössze annyi a teendő, hogy a tábla helyébe a komplett lekérdezést kell írni!

```sql
SELECT ...
FROM (SELECT ...);
```

Van, amikor egyszerű kérdéseknél is elkerülhetetlenek ezek. 

### "Hányféle"-feladatok
Például: **Hányféle** második nyelvet lehet tanulni?

Nagyon fontos, hogy ez ROSSZ MEGOLDÁS:
```sql
SELECT DISTINCT Count(nyelv2)
FROM J;
```
Ez ugyanis kiválogatja a különböző *rekordokat* (mivel nincs két azonos értékű rekord, nem dob ki semmit), majd utána számolja össze őket. Ezért lesz ennek az eredménye 36.
A valós válasz azonban 2. 

Tehát a probléma az, hogy a ``DISTINCT`` és a ``COUNT`` programozási tételek nem a számunkra szükséges sorrendben vannak alapértelmezés szerint egymás után komponálva. 

Ezt úgy tudjuk megvalósítani, hogy részletesen végigírjuk a kompozíciót. Először kiválogatjuk a nyelveket, és az így keletkező (kétrekordos) táblán futtatjuk a megszámlálást:

```sql
SELECT COUNT(*)
FROM (SELECT DISTINCT nyelv2 FROM J);
```

Vagy máshogy tördelve:

```sql
SELECT COUNT(*)
FROM (
    SELECT DISTINCT nyelv2 
    FROM J
    );
```


> **VIGYÁZAT**: Itt sem szerepel pontosvessző a beágyazott lekérdezésben, csak a teljes utasítás legvégén!

A legtipikusabb példák a beágyazott lekérdezésekre a halmazműveletek sql-beli megvalósításai.
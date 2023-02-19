# Tartalomjegyzék
- [WHERE hagyományosan](#predikátumok)
    - [Konstans dátumok megadása](#konstans-dátumok-megadása)
- [WHERE mintaillesztéssel](#where--like)
# ``WHERE``

A rekordokat szűrni nem csak a lista elejének kiemelésével vagy az ismétlődések eltüntetésével lehet. **A ``WHERE`` a logikai értékű függvényekkel (predikátumokkal) való szűrésre szolgál.**

**FONTOS**: A WHERE mindig a FROM után helyezkedik el és csak egyetlen WHERE tag lehet egy lekérdezésben!

## Predikátumok
Közismertebb predikátumok:
| Szimbólum  |   Leírás             |        Példa     |
|------------|----------------------|------------------|
| ... = ...  | azonosság            | ``nyelv2 = "spanyol"`` |
| ... <> ... | különbözés           | ``nyelv2 <> "spanyol"``|
| ... < ...  |   kisebb             | ``egyuttlakok < 3``  |
| ... > ...  |   nagyobb            | ``egyuttlakok > 3``  |
| ... <= ... | kisebb vagy egyenlő  | ``egyuttlakok <= 3`` |
| ... >= ... | nagyobb vagy egyenlő | ``egyuttlakok >= 3`` |
| ... BETWEEN ... AND ... | két érték között (zárt intervallum) | ``egyuttlakok BETWEEN 1 and 3`` |



például a következő feltétel kiválogatja a német nyelvet tanulókat:

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
## Szűrés konstans dátummal
Ritkán, de szükség van konstans dátumok megadására is. Ilyenkor MS Access-ben a ``#YYYY-MM-DD#`` formátumot kell követni. Például ha ki akarjuk szűrni a 2005. év szilveszterekor született tanulókat, akkor azt kétféleképpen is tehetjük:

A dátumok [projekciófüggvényeivel](../01_SELECT/README.md#műveletek):
```sql
SELECT *
FROM J
WHERE YEAR(szulido)  = 2005 
  AND MONTH(szulido) = 12 
  AND DAY(szulido)   = 31;
```

Vagy röviden:

```sql
SELECT *
FROM J
WHERE szulido = #2005-12-31#;
```


## WHERE ... LIKE ...

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


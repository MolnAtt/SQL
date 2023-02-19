# 3000M+: Csongrád megye települései
## Forrás
A 3000M feladat adatbázisának adatbáziskezelésre átalakított nyers .tsv (tabulator separated value, tabulátorokkal tagolt) fájlja itt található meg: 
- [M.tsv](M.tsv)

## Adatbázis szerkezete
A továbbiakban feltesszük, hogy a tábla neve ``M``, a mezők nevei a fájl első sorában lévő értékeknek felelnek meg, azaz: 
- ``id`` (természetes szám): a település azonosítója.
- ``nev`` (szöveg): a település neve.
- ``rang`` (szöveg): a település rangja.
- ``kisterseg`` (szöveg): a település kistérségi besorolása.
- ``terulet`` (természetes szám): a település területe hektárban
- ``nepesseg`` (természetes szám): a település népessége.
- ``lakasszam`` (természetes szám): a településen lévő lakások száma.

## Beadás
Amennyiben Access-ben dolgozol, minden kérdést a kérdés sorszámával elnevezett lekérdezésként ments.
De ha Accessben dolgozol, ha nem, mindenképp létezzen egyetlen,  ``m.sql`` nevű fájl, amiben mindegyik feladat sql lekérdezése megvan.
Az lekérdezések előtt kommentben szerepeljen a a feladat sorszáma és a feladat szövege!

Például részlet a ``m.sql`` fájlból:

```sql
-- 1. Hány település található az input fájlban?

SELECT ...;

-- 2. Hány község rangú település található?

SELECT ...;
```
## Feladatsor
1. Hány település található az input fájlban?
2. Hány község rangú település található?
3. Hány város rangú település található a Makói kistérségben?
4. Írja ki a város rangú települések közül az 10000 főnél népesebb települések nevét és népességét!
5. Mennyi a legnépesebb település lélekszáma?
6. Melyik a legnépesebb település? Írja ki a település nevét és lélekszámát!
7. Melyik a Makói kistérség legkisebb területű települése(i)?
8. Írja ki a Makói kistérség településeinek népsűrűségét!
9. Melyik településen a legrosszabb a lakáshelyzet? (Egy lakásra a legtöbb lakos jut.)
10. Készítsen kimutatást kistérségi bontásban, amelyben megadja az egyes kistérségek településeinek a számát!
11. Készítsen kimutatást kistérségi bontásban, amelyben megadja az egyes kistérségek összlakosságának a számát!
12. Készítsen kimutatást kistérségi bontásban, amelyben megadja az egyes kistérségek összterületének a nagyságát!
# 3000N+: Utazási iroda
## Forrás
A 3000N feladat adatbázisának adatbáziskezelésre átalakított nyers .tsv (tabulator separated value, tabulátorokkal tagolt) fájlja itt található meg: 
- [N.tsv](N.tsv)

## Adatbázis szerkezete
A továbbiakban feltesszük, hogy a tábla neve ``N``, a mezők nevei a fájl első sorában lévő értékeknek felelnek meg, azaz: 
- ``tajegyseg`` (szöveg): az utazást érintő tájegység neve.
- ``ejszaka`` (természetes szám): az eltöltendő éjszakák száma, ami legfeljebb 7.
- ``csalados`` (logikai): családos vagy egyéni út.
- ``honap`` (szöveg): melyik hónapra érvényes az ajánlat.
- ``maxletszam`` (természetes szám): Maximális létszám.
- ``jelentkezesek`` (természetes szám): eddig jelentkezettek száma
- ``ar`` (természetes szám): részvételi díj egy főre.

## Beadás
Amennyiben Access-ben dolgozol, minden kérdést a kérdés sorszámával elnevezett lekérdezésként ments.
De ha Accessben dolgozol, ha nem, mindenképp létezzen egyetlen,  ``n.sql`` nevű fájl, amiben mindegyik feladat sql lekérdezése megvan.
Az lekérdezések előtt kommentben szerepeljen a a feladat sorszáma és a feladat szövege!

Például részlet a ``n.sql`` fájlból:

```sql
-- 1. Hány ajánlat található az input fájlban?

SELECT ...;

-- 2. Hány őrségi tájegységre vonatozó ajánlat található az input fájlban?

SELECT ...;
```
## Feladatsor
1. Hány ajánlat található az input fájlban?
2. Hány őrségi tájegységre vonatozó ajánlat található az input fájlban?
3. Hány hortobágyi tájegységre vonatozó, júliusi, egy hetes ajánlat található az input fájlban?
4. Válogassuk ki a mátrai tájegységre vonatozó, családos, még szabad hellyel rendelkező ajánlatokat!
5. Válogassuk ki a bükki tájegységre vonatozó, májusi, még szabad hellyel rendelkező, 30000Ft és 50000 Ft közé eső ajánlatokat!
6. Hány forintba kerül a legdrágább ajánlat?
7. Hány napos a legdrágább ajánlat?
8. Válogassuk ki a mecseki utak közül azokat, melyekre minden hely elkelt.
9. Válogassuk ki a legolcsóbb ajánlatokat? (azaz azon ajánlatokat, amelyeknél egyik más ajánlat sem olcsóbb!)
10. Válogassuk ki a nyári, legalább 5 napos ajánlatok közül a legolcsóbbakat!
11. Hány különböző tájegységre szervez az iroda utazásokat?
12. Készíts kimutatást, hogy hány éjszakás utakra hány foglalás történt!
13. Mely hónapban hány jelentkező van?
14. Mely tájegység mennyi pénzt hoz az irodának?
15. Mely tájegységre mennyi hely vehető még ki?
16. Mely tájegységre van még a legtöbb szabad hely?
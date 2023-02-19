# 3000O+: Afrika és Amerika
## Forrás
A 3000O feladat adatbázisának adatbáziskezelésre átalakított nyers .tsv (tabulator separated value, tabulátorokkal tagolt) fájlja itt található meg: 
- [O.tsv](O.tsv)

## Adatbázis szerkezete
A továbbiakban feltesszük, hogy a tábla neve ``O``, a mezők nevei a fájl első sorában lévő értékeknek felelnek meg, azaz: 
- ``nev`` (szöveg): az adott ország neve.
- ``allamforma`` (szöveg): az ország államformája
- ``terulet`` (természetes szám): terület négyzetkilométerben
- ``nepesseg`` (természetes szám): népesség ezer fő egységben
- ``földrész`` (szöveg): Földrész, amelyen az ország található.

## Beadás
Amennyiben Access-ben dolgozol, minden kérdést a kérdés sorszámával elnevezett lekérdezésként ments.
De ha Accessben dolgozol, ha nem, mindenképp létezzen egyetlen,  ``o.sql`` nevű fájl, amiben mindegyik feladat sql lekérdezése megvan.
Az lekérdezések előtt kommentben szerepeljen a a feladat sorszáma és a feladat szövege!

Például részlet a ``o.sql`` fájlból:

```sql
-- 1. Hány ország található az input fájlban?

SELECT ...;

-- 2. Határozza meg a dél-amerikai földrész területének a nagyságát négyzetkilométerben!

SELECT ...;
```

## Feladatsor
1. Hány ország található az input fájlban?
2. Határozza meg a dél-amerikai földrész területének a nagyságát négyzetkilométerben!
3. Hány ország található az afrikai földrészen?
4. Hány 5000 négyzetkilométernél kisebb ország található az afrikai földrészen?
5. Hány 15000 és 25000 négyzetkilométer közé eső ország található az dél-amerikai földrészen?
6. Hány 20 milliónál nagyobb népességű ország található az amerikai földrészen?
7. Válogassa ki a 20 milliónál népesebb amerikai országokat!
8. Mekkora a lakossága a fájlban található legkisebb népességű országnak?
9. Mekkora a területe a fájlban található legkisebb népességű országnak?
10. Mekkora a népsűrűsége a legsűrűbben lakott afrikai országnak (fő/négyzetkilométer)?
11. Melyik a legsűrűbben lakott afrikai ország és mennyi a területe, lakossága, népsűrűsége?
12. Milyen államformák léteznek az input fájlban? Mindegyik csak legfeljebb egyszer szerepeljen!
13. Mely államformát hány ország követi?
14. Mely földrészen hány ország van?
15. Mely földrészen melyik államformát hány ország követi? (pl. Afrika - köztársaság: ... db \n Dél-Amerika - szövetségi köztársaság: ... db \n ... )
16. Mely államformában hány lakos él összesen?
17. Mennyi a különböző földrészeken található országok területösszegei? (pl.: Afrika: ...\n Dél-Amerika: ...\n ...)
18. Add meg különböző államformákhoz tartozó legsűrűbben lakott országokat!
# 3000L+: Színészek
## Forrás
A 3000L feladat adatbázisának adatbáziskezelésre átalakított nyers .tsv (tabulator separated value, tabulátorokkal tagolt) fájlja itt található meg: 
- [L.tsv](L.tsv)

## Adatbázis szerkezete
A továbbiakban feltesszük, hogy a tábla neve ``L``, a mezők nevei a fájl első sorában lévő értékeknek felelnek meg, azaz: 
- ``nev`` (szöveg): a színész neve.
- ``nem`` (logikai): a színész neme.
- ``szulido`` (dátum): A színész születési ideje.
- ``szulvaros`` (szöveg): A színész születésének helye (település).
- ``szulorszag`` (szöveg): A színész születési országa.
- ``filmszam`` (természetes szám): A világbajnokság helyszíne.
## Beadás
Amennyiben Access-ben dolgozol, minden kérdést a kérdés sorszámával elnevezett lekérdezésként ments.
De ha Accessben dolgozol, ha nem, mindenképp létezzen egyetlen,  ``l.sql`` nevű fájl, amiben mindegyik feladat sql lekérdezése megvan.
Az lekérdezések előtt kommentben szerepeljen a a feladat sorszáma és a feladat szövege!

Például részlet a ``l.sql`` fájlból:

```sql
-- 1. Írja ki a Budapesten született színészek nevét és filmjeinek a számát!

SELECT ...;

-- 2. Hány színész született az USA-ban?

SELECT ...;
```
## Feladatsor
1. Írja ki a Budapesten született színészek nevét és filmjeinek a számát!
2. Hány színész született az USA-ban?
3. Hány férfi színész született Magyarországon?
4. Hány férfi színész született Skóciában vagy Angliában?
5. Hány színész született 1970 és 1975 között angolszász nyelveterületen (USA, Anglia, Ausztrália)?
6. Írja ki a legfiatalabb színész(ek) nevét és születési évét!
7. Hány filmben játszott a legtöbb filmben szereplő színész?
8. Hány filmben játszott a legtöbb filmben szereplő, Magyarországon született színész?
9. Melyik évben született a legtöbb színész? Az évet és a színészek számát is írja ki!
10. Melyek azok a napok, amikor több színész is ünnepli a születésnapját? (Vigyázat, két ember ünnepelheti ugyanaznap a születésnapját akkor is, ha nem egyidősek!)
11. Van-e olyan nap, amikor 3 színész is ünnepli a születésnapját? Írja ki a színészek nevét és születési dátumait (6 mező)! 
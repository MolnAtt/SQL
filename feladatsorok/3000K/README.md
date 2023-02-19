# 3000K+: Világbajnokságok
## Forrás
A 3000K feladat adatbázisának adatbáziskezelésre átalakított nyers .tsv (tabulator separated value, tabulátorokkal tagolt) fájlja itt található meg: 
- [K.tsv](K.tsv)

## Adatbázis szerkezete
A továbbiakban feltesszük, hogy a tábla neve ``K``, a mezők nevei a fájl első sorában lévő értékeknek felelnek meg, azaz: 
- ``id`` (természetes szám): A sorszám. *Ez az elsődleges kulcs.*
- ``orszag`` (szöveg): a résztvevő csapat országa, amely a helyezést elérte.
- ``helyezes`` (természetes szám): Az elért helyezés, amely legfeljebb 40.
- ``ev`` (természetes szám): A világbajnokság éve.
- ``helyszin`` (szöveg): A világbajnokság helyszíne.

## Beadás
Amennyiben Access-ben dolgozol, minden kérdést a kérdés sorszámával elnevezett lekérdezésként ments.
De ha Accessben dolgozol, ha nem, mindenképp létezzen egyetlen,  ``k.sql`` nevű fájl, amiben mindegyik feladat sql lekérdezése megvan.
Az lekérdezések előtt kommentben szerepeljen a a feladat sorszáma és a feladat szövege!

Például részlet a ``k.sql`` fájlból:

```sql
-- 1. Írja ki Magyarország által elért helyezéseket. A kiírásban jelenjen meg a vb éve és helyszíne is!

SELECT ...;

-- 2. A program írja ki, hogy az '30-as években kik lettek a világbajnokok! Az ország neve mellett szerepeljen az évszám is!

SELECT ...;
```

## Feladatsor
1. Írja ki Magyarország által elért helyezéseket. A kiírásban jelenjen meg a vb éve és helyszíne is!
2. A program írja ki, hogy az '30-as években kik lettek a világbajnokok! Az ország neve mellett szerepeljen az évszám is!
3. Írja ki Magyarország hányszor jutott ki a vb-re a fájl által tartalmazott időszakban!
4. Mely csapat nyert 1960-ban?
5. Hányszor kapott ki a döntőben Argentína?
6. Az adatfájl szerint mikor volt a legkorábbi vb?
7. Peru hányszor nyert vb-t?
8. Írd ki Chile vb-n elért legjobb helyezését!
9. Mely csapatok nyertek az Angiában rendezett vb-ken? A csapatok neve mellett az évszámot is írja ki!
10. Mely csapat nyerte a vb-t, amikor Brazília dobogós helyzést ért el? A győztes csapatok neve mellett az évszámot is írja ki!
11. Kikkel játszott döntőt Brazília? Az ellenfél csapat neve mellett az évszámot is írja ki!
12. Mely csapat nyert többször is vb-t?
13. Mely csapat(ok) nyert(ek) a legtöbbször vb-t? A csapat neve mellett a vb gyözelmmek számát is írja ki! Ha több találat is van, akkor mindegyik szerepeljen!
15. Add meg a különböző helyszíneket, ahol az adatfájl szerint világbajnokság zajlott!
16. Melyik évből származik a legtöbb adat az adatok között, a legelső évszámtól napjainkig?
17. Melyik évtizedből hány adat származik? (30-as évek, 40-es évek, stb.)
18. Add meg, hogy a lehetséges helyezések közül melyikhez hány adat kapcsolódik az input fájlban? (1. helyezésből ... db, 2. helyezésből ... db, stb.) A kiírás legyen helyezés szerint növekvő sorrendben!
19. A különböző országok pontversenyeznek is: Az első helyezés 6 pontot ér, a második 5-öt, ... , az hatodik 1 pontot, minden további helyezés pedig 0 pontot ér. Add meg, hogy mely országnak hány pontja van így!
20. Mely országnak van a legtöbb pontja a fent leírt pontversenyben?

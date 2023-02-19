# 3000.J Osztály
A .csv (comma separated value) fájlja itt található meg: [J.csv](J.csv).
Az adatbázis első sora tartalmazza a mezőneveket.

A mezők jelentése:

A továbbiakban feltesszük, hogy a tábla neve ``J``, a mezők nevei a fájl első sorában lévő értékeknek felelnek meg, azaz: 
- ``id`` (szám): A törzslapszám. *Ez az elsődleges kulcs.*
- ``nev`` (szöveg): A tanuló neve.
- ``matinfo`` (szöveg): A matematika és informatika szerinti csoportbontás.
- ``angol`` (szöveg): Az angolcsoport
- ``nyelv2`` (szöveg): A második nyelv szerinti csoport.
- ``nem`` (logikai): Biológiai nem (a -1 a fiú és a 0 a lány).
- ``egyuttlakok`` (szám): Az együttlakók száma. 
- ``testverek`` (szám): A testvérek száma
- ``szulido`` (dátum): A tanuló születési ideje.
- ``huzottid`` (szám): A karácsonyi húzás során húzott tanuló törzslapszáma. *(Idegen kulcs.)*

Amennyiben Access-ben dolgozol, minden kérdést a kérdés sorszámával elnevezett lekérdezésként ments.
De ha Accessben dolgozol, ha nem, mindenképp létezzen egyetlen,  ``j.sql`` nevű fájl, amiben mindegyik feladat sql lekérdezése megvan.
Az lekérdezések előtt kommentben szerepeljen a a feladat sorszáma és a feladat szövege!

Például részlet a ``j.sql`` fájlból:

```sql
-- 1. Hány diák tanul az osztályban?

SELECT ...;

-- 2. Hány lány tanul az osztályban?

SELECT ...;
```

# Feladatok

1. Hány diák tanul az osztályban?
2. Hány lány tanul az osztályban?
3. Kik az egykék? (Akiknek nincs testvérük?)
4. Hány egyke van?
5. Kik tanulnak a kettes angol csoportban? (Csak annyit tehetünk fel, hogy az angolcsoportok neve számmal kezdődik, ez alapján kell megtalálni!)
5. Add meg az olasz második nyelvi csoport tanulóinak névsorát (ábécé-sorrendben!)
6. Hány fiú tanul az alfa matematika-informatika csoportban?
7. Mekkora a legnagyobb család az osztályban?
8. Adj meg egy diákot, akinek a legtöbb testvére van!
9. Viszonylag kevés azon családok száma, ahol az együttlakók száma és a testvérek száma között nem három a különbség. Adja meg a számukat!
10. Hát Izsák hiányzott a legutóbbi angol órán, szeretné bepótolni a hiányzást. Adja meg azon tanulók nevét, akik vele azonos angol csoportba járnak.
11. Melyik második nyelvet hányan tanulják az osztályban?
12. Ki a legidősebb és a legfiatalabb diák, illetve mennyi köztük a korkülönbség? (Egy lekérdezéssel!)
13. Hány különböző angolcsoport van?
14. Melyik a leggyakrabban előforduló testvérszám?
15. Add meg mindegyik második nyelvi csoportra, hogy az adott csoportban átlagosan hány testvérrel rendelkeznek a tanulók!
16. Add meg angolcsoportonként a névsorban első és utolsó diák nevét!
17. Add meg, hogy hányan húzták a karácsonyi húzás során önmagukat!
18. Add meg, hogy hány olyan pár van az osztályban, akik egymást húzták!
19. Add meg, hogy hány olyan tanulónégyes van az osztályban, akik "körbehúzták" egymást!
20. Felmerült, hogy esetleg elrontották (meghamisították?) a karácsonyi húzást. Add meg, hogy hány olyan tanuló van az osztályban, akit többen is húztak!
21. Add meg, hogy hány olyan tanuló van az osztályban, akit senki sem húzott!

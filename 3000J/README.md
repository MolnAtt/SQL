### J: példa-adatbázis szerkezete
A 3000J feladat adatbázisának adatbáziskezelésre átalakított nyers .csv (comma separated value) fájlja itt található meg: [J.csv](J.csv).

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

### Tábla importálása: J
- [Tábla importálása](import/)
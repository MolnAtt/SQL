# Tartalomjegyzék
- [ORDER BY ASC](#order-by)
- [ORDER BY DESC](#order-by--ascdesc)
- [Maximumkeresés](#maximumkeresés-sorbarendezéssel)

# ORDER BY

Az ``ORDER BY`` arra szolgál, hogy sorbarendezze a listát egy adott szempont szerint. A szempontot megintcsak egy szelektorral, azaz egy rekordokon értelmezett függvénnyel biztosítjuk.

Elsősorban projekciófüggvényeket használunk, azaz pl. a következő lekérdezés az osztályt születési idejük szerint rakja sorba:

```sql
SELECT nev, szulido
FROM J
ORDER BY szulido;
```

használhatunk azonban egyéb szempontokat is, például ha egy olyan listát akarunk készíteni, ahol a diákok aszerint vannak sorba rakva, hogy a születésnapjaik hogyan követik egymást január 1-jétől kezdve, akkor ezt így tudjuk lekérdezni:

```sql
SELECT nev, szulido
FROM J
ORDER BY MONTH(szulido), DAY(szulido);
```

*(Ez más eredményt ad, mint az előző! Például egy 2005.12.31. később lesz, mint 2006.01.01, pedig korábbi a dátum!)*

Ez utóbbi egyben példa arra is, hogy hogyan lehet elsődleges, másodlagos stb. szempontok alapján is sorbarendezni: vesszővel kell elválasztani a szempontokat. 



## ORDER BY ... ASC/DESC
A sorbarendezés alapértelmezés szerint mindig növekvő, (szövegek esetén hagyományos ábécé-sorrend).

Ha mégis fordított sorrendben szeretnénk rendezni, akkor azt a ``DESC`` kiegészítéssel lehet elérni:

```sql
SELECT nev, szulido
FROM J
ORDER BY szulido DESC;
```

Létezik az ``ASC`` kiegészítés is, ami a növekvő sorrendet jelenti. Ezt akkor használjuk, amikor egymást követő rendezési szempontok során akarjuk explicitté tenni, hogy melyik szempont növekvő, csökkenő...

```sql
SELECT nev, egyuttlakok, testverszam
FROM J
ORDER BY egyuttlakok DESC, szulido ASC, nev ASC;
```

## Maximumkeresés sorbarendezéssel

Habár nem hatékony, de egy kényelmes módja a sorbarendezés egy minimális tulajdonságú rekord megkeresésének:
1. Rendezzük nagyság szerint sorba az osztályt
2. Vegyük az első elemet. 

Keressük a legidősebb tanulót:
```sql
SELECT TOP 1 *
FROM J
ORDER BY szulido
```

A feladat természetesen [sorbarendezés nélkül is megoldható](#beágyazás-értékek-helyére), de beágyazott lekérdezést kell használni hozzá.

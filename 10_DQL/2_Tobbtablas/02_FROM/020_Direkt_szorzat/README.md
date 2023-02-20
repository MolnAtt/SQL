# Direkt szorzat
A direkt szorzat matematikai definíciója a következő:

$$ A\times B \overset{\mathrm{def}}{=} \{ (a, b) : a\in A \land b\in B  \}$$
Egy rövid példa erejéig vegyünk két nagyon egyszerű adatbázist. Az első adatbázisban 3 db szám van, ``1``, ``2`` és ``3``, a másikban két betű, ``a`` és ``b``. 

$$A \overset{\mathrm{def}}{=} \{ 1; 2; 3 \}$$

$$B \overset{\mathrm{def}}{=} \{ a; b \}$$

Ekkor 

$$ A\times B = \{ (1; a); (2; a); (3; a); (1; b); (2; b); (3; b) \} $$

Gondoljunk úgy ezekre a rendezett párokra, mint két csúcshalmaz közt menő élekre egy gráfban:

![Direkt_szorzat](/10_DQL/2_Tobbtablas/02_FROM/020_Direkt_szorzat/direkt_szorzat.jpg)






## Kézfogás-példa
A 3000.J osztályban az a szokás, hogy amikor két fiú találkozik, kezet fognak egymással. Adjuk meg az összes kézfogást, azaz adjuk meg azon párokat, akik kezet fogtak egymással!

```sql
SELECT *
FROM 
    (SELECT nev FROM J WHERE nem) as J1, 
    (SELECT nev FROM J WHERE nem) as J2
WHERE J1.nev <> J2.nev;
```

Fáradt és túlságosan progresszív vagyok ahhoz, hogy kitaláljak valamit, amit az osztály minden fiú diákja csinál akkor, amikor egy lánnyal találkozik, de tegyük fel, hogy van valami szokás az ilyen alkalmakra is. Adjuk meg az összes ilyen alkalmat!

```sql
SELECT *
FROM 
    (SELECT nev FROM J WHERE nem) as J1, 
    (SELECT nev FROM J WHERE NOT nem) as J2
```

> Érdemes tehát úgy gondolni bármely két halmaz direkt szorzatára, mint mikor két két társaság találkozik, és a társaságokon belül nem történnek köszöntések, de a társaságok között igen. Ilyenkor a direkt szorzat pontosan ezeket az irányított üdvözléseket írja le.

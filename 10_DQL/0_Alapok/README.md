# Alapok
Egy táblához kapcsolódó **elemi lekérdezés** minimális szerkezete a következő:
```sql
SELECT ...
FROM ... ;
```
Maximális szerkezete pedig: 
```sql
SELECT ...
FROM ...
WHERE ...
GROUP BY ...
HAVING ...
ORDER BY ... ;
```

A ``WHERE``, ``GROUP BY``, ``HAVING``, ``ORDER BY`` parancsok tehát nem kötelező összetevői egy DQL utasításnak. Ha viszont előfordulnak, akkor **egymáshoz viszonyított sorrendjük mindig ez kell legyen!**

**Az utasításokat mindig pontosvessző (``;``) zárja.** Egyes adatbáziskezelők (pl. MS Access) kiteszik az elhagyott ``;``-ket a sor végén. 

Az SQL-interpreterek nem érzékenyek arra, hogy ezek a szavak **nagybetűvel legyenek szedve**, de illik erre odafigyelni. (Hajdanán a HTML tag-eket is illett nagybetűvel szedni, de azóta ez a szokás ott már eltűnt.)

**A whitespace-eknek (szóköz, tab, sortörés) jelentősége nincs.** Az értelmező ezeket figyelmen kívül hagyja, az első pontosvesszőig olvas mindent, mielőtt megpróbálja az utasítást végrehajtani.
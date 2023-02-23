

emlékeztető: 
- Koordinátageometriában igazából a vektorok az "első osztályú utasok". Egy vektor koordinátái azt mondják meg, hogy mekkora jobbra és mekkora felfelelépést jelent (azaz hogyan állítható elő a bázisvektorokból). Koordinátageometriában pontok tulajdonképpen nincsenek: helyvektorok vannak, amik azt írják le, hogy hogyan lehet eljutni az origóból az adott pontba. Ezeket azonosítjuk a pontokkal. 
- Két vektor összege a megfelelő koordináták összegével meghatározott vektor. 
- Egy vektor skalárszorosa a vektor koordinátáinak skalárszorosai által meghatározott vektor.
- Egy vektor ellentettje a -1-szerese.
- Két vektor különbsége nem más, mint a kisebbítendő vektor és a kivonandó vektor ellentettjének az összege.
- Két vektor skalárszorzata nem más, mint a vektorok megfelelő koordinátáinak szorzatainak összege.
- Egy vektor hossza a saját magával vett skaláris szorzatának gyöke.
- Két pont közt menő vektor a két pont helyvektorának különbségvektora.
- Két pont távolsága a köztük menő vektor hossza.
- Egy pont alakzattól való távolsága nem más, mint az alakzat hozzá legközelebb eső pontjától való távolsága.
- Két vektor pontosan akkor zár be derékszöget, ha a skaláris szorzatuk nulla.
- Egy vektor pozitív irányú elforgatása úgy történik, hogy a koordinátákat megcseréljük és az így keletkezett vektor x kooordinátáját az ellentettjére változtatjuk. A negatív irányú forgatás ugyanígy történik, csak a második koordinátát negáljuk.

Kis kitekintő a jobbra-balra fordulásokhoz, konvexitáshoz, háromszögben való tartalmazáshoz: Geometriai algoritmusok kulcsfogalma: Fordul innen: http://tehetseg.inf.elte.hu/szakkorefop2017/pdf/elteikszakkor_geometria_20181101.pdf


# Import (tsv)
Készíts adatbázist a P.txt tabulátorokkal tagolt szöveges állomány alapján!

Válaszolj a következő kérdésekre!

# Export (LaTeX + TikZ, online: Overleaf)
0. Készíts lekérdezést, amely segítségedre van ahhoz, hogy a pontokat áttekintsd! Ehhez van a git-repoban egy main.tex, amit lefuttatva egy LaTeX Compilerrel ki is jön a dolog, ha az export egy pontok.tex fájl ugyanabban a könyvtárban. De inkább irány az overleaf online tex-szerkesztő!

Ez alapján az 1.(-243;279) pontot -- az adott környezen belül -- a következő kóddal lehet elhelyezni:

```latex
\node[potty] at (-243,279){};
```

Készíts ilyen exportot, hogy rá lehessen nézni a kódra!

# Szűrések
1. Add meg az első síknegyedbe eső pontokat!
0. Add meg az első vagy utolsó síknegyedbe eső pontokat!
0. Melyek azok a pontok, amelyek az origó körüli 100 sugarú körön belül vannak?

# Selectek
1. Add meg az összes pont x tengelytől, y tengelytől, és origótól való távolságát!

# Összesítések
1. Hány pont esik a koordinátatengelyekre?
0. Mely pont esik a legközelebb az y-tengelyhez?
0. Mely pont esik a legközelebb az x-tengelyhez?
0. Mely pont esik a legközelebb az origóhoz?
0. Mely pont esik a legtávolabb az origótól?
0. Mely pont esik a legtávolabb a tengelyektől? (tehát a két tengely uniójától)
0. Mely pont esik a legközelebb a -45 fok irányszögű origón átmenő egyeneshez?

# Pontpárok
1. Melyek azok a pontpárok, amelyek egymás fölött helyezkednek el? (Függőleges szakasz köti össze őket)
0. Melyek azok a pontpárok, amelyek egymás mellett helyezkednek el? (Vízszintes szakasz köti össze őket)
0. Van-e olyan pontpár, amelyek egymásra esnek?
0. Sorold fel azon pontokat, amelyek egymás origóra való tükörképei 
0. Sorold fel azon pontokat, amelyek egymás x tengelyre vonatkozó tükörképei
0. Sorold fel azon pontokat, amelyek egymás y tengelyre vonatkozó tükörképei
0. Melyik a két egymástól legtávolabb eső pont?
0. Melyik a két egymáshoz legközelebb eső pont?

# Ponthármasok
1. Sorold fel azon különböző ponthármasokat, amelyek közül a középső a két szélső között van (inklúzívan értendő)! A relációt nevezd B-nek (Alfred Tarski Between-relációja)
0. Hány olyan ponthármas van, amelyekre igaz, hogy az egyik a másik körül 90 fokkal elforgatva a harmadikba esik?
0. Sorold fel azon különböző ponthármasokat, amelyre igaz, hogy az elsőből a másodikba menet a harmadik fele fordulás balra történik!
0. Sorold fel azon különböző ponthármasokat, amelyre igaz, hogy az elsőből a másodikba menet a harmadik fele fordulás jobbra történik!
0. Sorold fel a szabályos háromszögeket!
0. Sorold fel az egyenlő szárú háromszögeket!

# Pontnégyesek
1. Sorold fel a rombuszokat!
0. Add meg az össze olyan pontnégyest, amelyre igaz, hogy az első pont benne van a másik három által meghatározott háromszögben!
0. Adott három pont, add meg a bennük lévő pontok halmazát!
0. Sorold fel azon különböző pontnégyeseket, amelyek egy konvex sokszöget határoznak meg!
0. Sorold fel a derékszöget bezáró vektorpárokat.
0. Hány olyan vektorpár van, amelyek közül az egyik a másik 90 fokos elforgatottja?
0. Készíts rajzolásra alkalmas kódot, ami lerajzolja az összes konvex négyszöget: Pl.: Az (1;2), (-3;4), (-1;-2), (3;-2) pontokat összekötő vonal kódja: 
```latex
\draw (1;2) -- (-3;4) -- (-1;-2) -- (3;-2) -- cycle;
```

# Csoportosítás
0. Melyik pont 10 sugarú környezetében van a legtöbb pont?
1. Melyik szakasz megy át a legtöbb ponton?
0. Melyik háromszögben van a legtöbb pont?

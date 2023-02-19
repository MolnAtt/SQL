## ``FROM``
A következőkben végig egytáblás lekérdésekkel, a ``J`` táblával dolgozunk, így a legtöbb lekérdezésünk mindig ezt fogja tartalmazni: ``FROM J``. 

Lehet más lekérdezést is írni a ``FROM`` után, pl. a következőt:


```sql
SELECT *
FROM (SELECT * FROM J);
```

bár ennek most, lássuk be, nem sok értelme volt.

A ``FROM`` klauzulának főleg a többtáblás lekérdezések esetében és a [lekérdezések egymásba ágyazása](#lekérdezések-beágyazásai) során van szerepe. Ezeket azonban azért, hogy az összefoglalónk lineárisan olvasható tankönyvként is használható legyen, később tárgyaljuk. 



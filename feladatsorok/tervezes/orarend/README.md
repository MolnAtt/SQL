# Adatbázis-tervezés: Órarend
Tervezz adatbázist egy órarend megjelenítésére és azon különböző lekérdezéseket végző webalkalmazás számára!

Szempontok: 
- Léteznek tantárgyak, amelyek hosszú, rövid névvel is bírnak és egy krétás megnevezéssel is rendelkeznek.
- Léteznek régiói az iskolának: Ónodi utcai szárny, kőrösi oldali szárny, aulák, tornacsarnok, stb.
- Léteznek termek, emeletszámmal és megnevezéssel, ritkább esetben, de nem minden esetben egy különleges névvel is (pl. Ogonovsky-terem) bírnak. Régiókhoz is tartozhatnak (melyik szárnyon van.)
- Minden terem egyértelműen egy régióban található.
- Léteznek tanárok, akiknek van nevük, rövidített nevük, monogramjuk, krétabeli nevük, és sorszámuk a teljes tanári névsorban (utóbbi azért fontos, hogy a teljes tanári órarendben állítható legyen, hogy melyikük hol foglaljon helyet).
- Vannak osztályok, ezeknek van krétabeli nevük, évfolyamuk (ez egy karakter), és egy évfolyamuk (gondoljuk a nyelvi előkészítősökre is!). Illetve egy sorszámuk is van. Jelenlétük az adatbázisban azért fontos, mert a diákórarendeket az osztályok szerint rendezzük be. A sorszámuk is ezért fontos.
- Csoportok
    - Vannak csoportok, ezek azok, akiknek az órákat tartják. Krétabeli (sokszor igen hosszú) nevük van, illetve adható meg nekik egyedi név is.
    - Egy csoport több osztályhoz is tartozhat (pl. nyelvi EF sávok!), ez azért fontos, mert ilyenkor több osztály órarendjében is szerepeltetni kell a nekik tartott órákat.
    - Egy osztály természetesen több csoportra is bomolhat.
- Léteznek órák is: Ezek mindig egy naphoz és egy órához (0, 1, 2, ...) tartoznak. Mindig egyértelműen egy tanár tartja az órát, és mindig egyértelműen egy csoportnak. Tantárgya is van az órának, ez is mindig egyértelmű. Terme is van az órának, ez is egyértelmű. 
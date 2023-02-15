# Bevezetés az SQL-nyelvbe
Az **SQL** jelentése: **S**tructured **Q**uery **L**anguage. 

Bármilyen komplex információt, összefüggést komoly rendszerekben adatbázisokban tárolunk. Ezek egy lehetséges módja az ún. relációs adatbázis, ezeknek a relációs adatbázisoknak pedig a kezelése az SQL-nyelven történik. Az SQL nyelv tanulása tehát az adatbáziskezelés tanulása maga.

Mielőtt azonban elmerülnénk abban, hogy mi mindent lehet adatbázisokkal modellezni (spoiler: mindent), kezdőknek egy leegyszerűsítő motiváció: Emlékezzünk vissza arra, hogy a 3000-es feladatoknál minden alkalommal egy nagy táblázatba foglalt adattömeget kellett feldolgozni. Pl.:
- **Eldöntés:** El kellett dönteni, hogy van-e megadott tulajdonságú elem a táblában.
- **Keresés:** Meg kellett találni egy adott tulajdonságú elemet.
- **Kiválogatás:** Ki kellett szűrni az adott tulajdonságú elemeket a listából.
- **Összegzés:** Össze kellett adni bizonyos számokat a listában.
- **Megszámlálás:** Meg kellett (adott tulajdonságú) elemeket számolni a listában.
- **Csoportosítás:** Adott szempont alapján kellett csoportosítani az elemeket.

Ezek az alapfeladatok az elemi programozási tételek, amelyekről egy külön jegyzet is szól (lásd [https://github.com/MolnAtt/Algoritmusok](https://github.com/MolnAtt/Algoritmusok))


Amíg nem tanulunk komolyabb dolgokat az adatbáziskezelésről, addig érdemes úgy gondolni az SQL nyelvre, hogy **egy olyan programozási nyelvről van szó, amelyben az alapvető vezérlési szerkezetek nem a ciklusok és az elágazások, hanem a programozási tételek maguk**. Ezáltal a tételekhez kapcsolódó feladatok megoldása nagyon rövid és egységes kinézetű lesz. 

# Résznyelvek
A SQL nyelv számos résznyelvre bomlik attól függően, hogy milyen utasításokról van szó. A résznyelveket fragmentumnak, "töredékeknek" is hívják a formális nyelveknél, néha így hivatkozom ezekre:
- **DDL**: **Data Definition Language**: táblák létrehozására és szerkezetük módosítására szolgáló nyelvi fragmentum.
- **DQL**: **Data Query Language**: Lekérdezési utasítások: **Ez gyakorlatilag az érettségi maga.**
- **DML**: **Data Manipulation Language**: adat (rekord)-manipulációs nyelvi fragmentum: az adattáblák "sorainak" manipulációjára szolgáló résznyelv. 
- **DCL**: **Data Control Language**: Az adatbázisokkal általában több felhasználó egyszerre dolgozik. Ezeknek a felhasználóknak különböző jogosultságaik vannak. Ezek kezeléséről szóló nyelvről van szó. 

# Adatbázis-tervezés: Napló
Tervezz adatbázist egy dolgozatok pontszámait nyilvántartó tanári naplót imitáló webalkalmazás számára! A naplóhoz a diákok is hozzáférnének (természetesen csak a rájuk vonatkozó adatokat tekinthetnék meg), ezért a tanulók részletes adatai is részét képezik az adatbázisnak: 

Szempontok: 
- Felhasználók:
    - Vannak felhasználók: van nevük, email-jük, felhasználónevük és jelszavuk
    - Vannak felhasználói csoportok, amelyeknek egyedi nevük van
    - Egy felhasználó több csoporthoz is tartozhat
    - Egy csoportba több felhasználó is tartozhat
    - Tanárok:
        - Egyes felhasználók (tanárok) írathatnak dolgozatot csoportokkal (azaz tanítják őket).
        - Egy tanár több csoportot is taníthat.
        - Egy csoportot több tanár is taníthat.
- Értékelendő téma
    - Léteznek értékelendő témák, amelyek nevekkel bírnak, csoporttal és tanárral. 
    - Egy értékelendő téma mindig csak egy tanárhoz tartozhat.
    - Egy értékelendő téma mindig csak egy csoporthoz tartozhat.
- Dolgozat
    - Léteznek dolgozatok, amelyek dátummal bírnak (mikor írták meg őket), százalékos határokkal (2-3-4-5-ös "ponthatárok") és egy értékelendő témához kapcsolódnak. Létezik egy súlyozásuk, ami lehet akár feles súlyozás is (röpdolgozat esetén például).
    - Egy dolgozat mindig csak egy értékelendő témához kapcsolódhat.
- Feladat
    - Léteznek feladatok, amelyeknek van egy neve, egy sorszáma (hanyadik feladat volt) és egy maximális elérhető pontszáma.
    - Egy feladat mindig csak egy dolgozathoz kapcsolódhat.
- Pont
    - Léteznek pontok, amelyeket a felhasználók értek el egy adott dolgozatban. Ezek lehetnek akár fél pontszámok is.
    - Egy pont mindig egyértelműen egy felhasználóhoz tartozik.
    - Egy pont mindig egyértelműen egy feladathoz tartozik.

# Adatbázis-tervezés: Házioldal
Tervezz adatbázist egy házioldal webalkalmazás számára: 

Szempontok: 
- Felhasználók:
    - Vannak felhasználók: van nevük, email-jük, felhasználónevük és jelszavuk
    - Vannak felhasználói csoportok, amelyeknek egyedi nevük van
    - Egy felhasználó több csoporthoz is tartozhat
    - Egy csoportba több felhasználó is tartozhat
    - Mentorrendszer:
        - Egyes felhasználók mentorálhatnak más felhasználókat. 
        - Egy felhasználónak több mentora is lehet.
        - Egy mentornak több mentoráltja is lehet.
- Házi feladatok:
    - Vannak feladatok (olyan értelemben, hogy egy adott feladat senkihez nem tartozik: A feladatleírást takarja csak és a nevet.), ezekhez tartozik egy url, ahol a részletes feladatleírás található.
    - Témakörök
        - Vannak témakörök, amelyek nevekkel rendelkeznek
        - Egy feladat több témakörhöz is tartozhat
        - Egy témakörhöz több feladat is tartozhat
    - Kitűzések
        - Léteznek kitűzések, amelyek arra szolgálnak, hogy az egyszerre kiosztott házik később együtt is módosíthatóak legyenek. 
        - Egy kitűzésnek mindig van egy gazdája, aki kitűzte az adott feladatot.
        - Egy kitűzéshez mindig csak egy feladat tartozik. 
    - Házik
        - Vannak házik, amelyek felhasználókhoz tartoznak. A házi lehet kidolgozatlan, hiányos, hibás, elfogadott. értékelhetetlen. Van határideje is.
        - Egy házi csak egy felhasználóé lehet.
        - Egy házihoz csak egy kitűzés tartozhat.
    - Megoldás
        - A megoldás egy szöveges tulajdonság, aminek van időpontja is.
        - Minden megoldás egy házihoz tartozik.
    - Bírálatok
        - A bírálatok szöveges üzeneteket tartalmaznak és egy értékítélettel bírnak (hiányos, hibás, elfogadott, értékelhetetlen) illetve egy dátummal.
        - Egy bírálatnak csak egyetlen gazdája gazdája van (a mentor).
        - Minden bírálat egyértelműen egy házi feladathoz tartozik.


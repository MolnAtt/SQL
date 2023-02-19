# ``HAVING``

A ``WHERE`` mindössze csak egyszer szerepelhet egy lekérdezésben. Ha ``GROUP BY``-jal együtt szerepel egy lekérdezésben, akkor az azt jelenti, hogy a **csoportosítás előtt történik** az elemek kiválogatása. 

Ha valaki mégis a csoportosítás után szeretne szűrni (pl. csak a legalább ötfős csoportokat szeretné megtartani), akkor erre a ``WHERE`` nem lesz alkalmas. Erre találták ki a ``HAVING``-et.

A következő lekérdezés kiválogatja a legalább 5 fős csoportokat:

```sql
SELECT testverszam, COUNT(*)
FROM J
GROUP BY testverszam
HAVING 5 <= COUNT(*);
```

Minden egyébben a HAVING ugyanúgy működik, mint a WHERE. 

Tehát a kettő közötti különbség:

- A ``WHERE`` a csoportosítás **előtt** szűr.
- A ``HAVING`` a csoportosítás **után** szűr.

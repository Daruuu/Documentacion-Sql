Numero de bases de datos que hay es 16 empezando a 0.

Para entrar a redis via terminal:
``` bash
redis-cli
```

https://lzone.de/cheat-sheet/Redis

funciona de tipo de Key-value

Redis trata los  valores como `bytes`.

El “valor” puede representar cualquier cosa y es que aquí donde se almacenan datos de las cinco
estructuras de las que dispone Redis.
- Cadena de texto
- Listas
- Hashes
- Conjunto
- Conjunto ordenados

``` bash
daruuu@pop-os:~
➤ redis-cli
127.0.0.1:6379> select 1
OK
127.0.0.1:6379[1]> config get database
(empty array)
127.0.0.1:6379[1]> CONFIG GET databases
1) "databases"
2) "16"
127.0.0.1:6379[1]> set user daruuu
OK
127.0.0.1:6379[1]> get user 
"daruuu"
127.0.0.1:6379[1]> 
```

Las claves que determinamos en Redis son sensibles a las mayúsculas y minúsculas. Pero
también debemos tener en cuenta lo siguiente:
- No utilizar caracteres especiales o acentos.
- No utilizar números al inicio del nombre.
- No utilizar espacios en blanco.
- No utilizar palabras reservadas para Redis.

GETRANGE
`<key><start><end>`
regresa un rango especifico del string
``` bash
127.0.0.1:6379[1]> GETRANGE user 20 51
":12345, web: https://www.google."
127.0.0.1:6379[1]> 
```

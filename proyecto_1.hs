-- Ejercicio 1

-- a)

esCero :: Int -> Bool
esCero x = x == 0

-- esCero 0
-- True
-- esCero 1
-- False

-- b)

esPositivo :: Int -> Bool
esPositivo x = x > 0

-- esPositivo 5
-- True
-- esPositivo (-1)
-- False

-- c)

esVocal :: Char -> Bool
esVocal x = x == 'a' || x == 'e' ||x == 'i' || x == 'o' ||x == 'u'

-- esVocal'v'
-- False
-- esVocal 'a'
-- True

-- d)

valorAbsoluto :: Int -> Int
valorAbsoluto x
  | x >= 0 = x
  | otherwise = -(x)

-- valorAbsoluto 3
-- 3
-- valorAbsoluto (-3)
-- 3

-- Ejercicio 2

-- a)

paratodo :: [Bool] -> Bool
paratodo [] = True 
paratodo (x:xs)
  | x == True = paratodo xs
  | otherwise = False

-- paratodo [True, True, False]
-- False
-- paratodo [True, True, True]
-- True

-- b)

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- sumatoria [4, 3, 2]
-- 9
-- sumatoria [2, 2, 6]
-- 10

-- c) 

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- productoria [4, 5, 2]
-- 40
-- productoria [7, 10, (-1)]
-- -70

-- d)

factorial :: Int -> Int
factorial x
  | x == 0 = 1
  | x > 0 = x * factorial (x - 1)

-- factorial 1
-- 1
-- factorial 2
-- 2
-- factorial 3
-- 6

-- e)

promedio :: [Int] -> Int
promedio [] = 0
promedio xs = div (sumatoria xs) (length xs)

-- promedio [2, 4]
-- 3
-- promedio [2, 4, 7]
-- 4

-- Ejercicio 3

pertenece :: Int -> [Int] -> Bool
pertenece x [] = False
pertenece x (y:ys)
  | x == y = True
  | otherwise = pertenece x ys

-- pertenece 4 [3, 4, 2, 1]
-- True
-- pertenece 4 [3, 2, 1]
-- False
-- pertenece 4 []
-- False

-- Ejercicio 4

-- a)

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t
  | t x = paratodo' xs t
  | otherwise = False

-- paratodo' [4, 3, 2] esPositivo
-- True
-- paratodo' [4, 3, (-2)] esPositivo
-- False

-- b)

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False
existe' (x:xs) t
  | t x = True
  | otherwise = existe' xs t

-- existe' [4, 3, 2] esCero
-- False
-- existe' [4, 0, 2] esCero
-- True

-- c)

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] t = 0
sumatoria' (x:xs) t = (t x) + sumatoria' xs t

-- sumatoria' [4, 6, 7] (+1)
-- 20
-- sumatoria' [4, (-6), 7] valorAbsoluto
-- 17

-- d)

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 1
productoria' (x:xs) t = (t x) * (productoria' xs t)

-- productoria' [(-3), (-4), 2] valorAbsoluto
-- 24
-- productoria' [(-3), (-4), 2] (*2)
-- 192 

-- Ejercicio 5

paratodo'' :: [Bool] -> Bool
paratodo'' xs = paratodo' xs (== True)

-- paratodo'' [True, True, False]
-- False
-- paratodo'' [True, True, True]
-- True

-- Ejercicio 6

-- a)

todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs even

-- todosPares [2, 3, 5]
-- False
-- todosPares [2, 4, 6]
-- True

-- b)

esMultiplo :: Int -> Int -> Bool
esMultiplo x y = x `mod` y == 0

hayMultiplo :: Int -> [Int] -> Bool 
hayMultiplo n xs = existe' xs (`esMultiplo` n)

-- hayMultiplo 4 [2, 6, 7]
-- False
-- hayMultiplo 4 [2, 6, 8]
-- True

-- c)

sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria' [0..(n - 1)] (^2)

-- sumaCuadrados 4
-- 14
-- sumaCuadrados 6
-- 55

-- d)

existeDivisor :: Int -> [Int] -> Bool
existeDivisor n ls = existe' ls (esMultiplo n)

-- existeDivisor 4 [3, 5, 7]
-- False
-- existeDivisor 4 [2, 5, 7]
-- True

-- e)

esPrimo :: Int -> Bool
esPrimo n = not (existeDivisor n [2..(n - 1)])

-- esPrimo 3
-- True
-- esPrimo 4
-- False

-- f)

factorial' :: Int -> Int
factorial' n = productoria [1..n]

-- factorial' 4
-- 24
-- factorial' 5
-- 120

-- g)

multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = productoria (filter esPrimo xs)

-- multiplicaPrimos [2, 3, 4, 8, 12, 16]
-- 6
-- multiplicaPrimos [2, 3, 7, 11]
-- 462

-- h)

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

arrayFib :: Int -> [Int] -> [Int]
arrayFib n [] = []
arrayFib n (x:xs)
  | fib x > n = []
  | fib x == n = [x]
  | otherwise = arrayFib n xs

esFib :: Int -> Bool
esFib n = existe' (arrayFib n [0..(n + 1)]) (>= 0)

-- esFib 11
-- False
-- esFib 34
-- True

-- i)

todosFib :: [Int] -> Bool
todosFib xs = paratodo' xs esFib

-- todosFib [1, 2, 5]
-- True
-- todosFib [19, 23, 49]
-- False

-- Ejercicio 7

-- I)
-- map :: (a -> b) -> [a] -> [b]
-- map: recibe una función de transformación y una lista; devuelve una lista cuyos elementos son el resultado de aplicar la función recibida a cada uno de los elementos de la lista original.

-- filter :: (a -> Bool) -> [a] -> [a]
-- filter: recibe una función de comprobación y una lista; devuelve una lista cuyos elementos son aquellos de la lista original que cumplieron con la comprobación solicitada por la función recibida, es decir, aquellos que pasaron por el "filtro".

-- II)
-- map succ [1, -4, 6, 2, -8] es equivalente a [2,-3,7,3,-7]
-- filter esPositivo [1, -4, 6, 2, -8] es equivalente [1,6,2]

-- Ejercicio 8
-- duplicarCadaElemento: duplica cada elemento de una lista xs

-- a)

duplicarCadaElemento :: [Int] -> [Int]
duplicarCadaElemento [] = []
duplicarCadaElemento (x:xs) = (x * 2):(duplicarCadaElemento xs)

-- duplicarCadaElemento [2, 4, 6, 8]
-- [4,8,12,16]
-- duplicarCadaElemento [3, 6, 9, 12]
-- [6,12,18,24]

-- b)

duplicarCadaElemento' :: [Int] -> [Int]
duplicarCadaElemento' xs = map (*2) xs

-- duplicarCadaElemento' [5, 10, 15]
-- [10,20,30]
-- duplicarCadaElemento' [6, 12, 18]
-- [12,24,36]

-- Ejercicio 9
-- soloPrimos: devuelve una lista solo con los primos de la lista xs

-- a)

soloPrimos :: [Int] -> [Int]
soloPrimos [] = []
soloPrimos (x:xs)
  | esPrimo x = x:(soloPrimos xs)
  | otherwise = soloPrimos xs

-- soloPrimos [2, 4, 7, 9, 11]
-- [2,7,11]
-- soloPrimos [2, 3, 5, 9, 11, 15, 19]
-- [2,3,5,11,19]

-- b)

soloPrimos' :: [Int] -> [Int]
soloPrimos' xs = filter esPrimo xs

-- soloPrimos' [1, 2, 7, 21, 23, 34]
-- [1,2,7,23]
-- soloPrimos' [1, 7, 16, 31, 47, 51]
-- [1,7,31,47]

-- c)

multiplicaPrimos' :: [Int] -> Int
multiplicaPrimos' xs = productoria (soloPrimos xs)

-- multiplicaPrimos' [2, 3, 5, 4, 8]
-- 30
-- multiplicaPrimos' [2, 6, 8, 4, 11]
-- 22

-- Ejercicio 10)

-- a)

primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA x [] = []
primIgualesA x (y:ys)
  | x == y = y:(primIgualesA x ys)
  | otherwise = []

-- primIgualesA 3 [3,3,4,1]
-- [3, 3]
-- primIgualesA 3 [4,3,3,4,1]
-- []


-- b)

primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' x ys = takeWhile (x ==) ys

-- primIgualesA' 'a' "aaa"
-- "aaa"
-- primIgualesA' 5 [5, 5, 5, 4, 5, 2, 5, 5]
-- [5,5,5]


-- Ejercicio 11)

-- a)

primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales (x:y:xs)
  | x == y = x:primIguales (y:xs)
  | otherwise = x:[]

-- primIguales [2, 3, 4, 4]
-- [2]
-- primIguales [4, 4, 3, 4]
-- [4,4]

-- b)

primIguales' :: Eq a => [a] -> [a]
primIguales' [] = []
primIguales' xs = primIgualesA' (xs!!0) xs
-- Alternativamente: primIguales' (x:xs) = primIgualesA' x (x:xs)

-- primIguales' [2, 2, 3, 4]
-- [2,2]
-- primIguales' "bbdb"
-- "bb"

-- Ejercicio 12)

cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op z [] t = z
cuantGen op z (x:xs) t = op (t x) (cuantGen op z xs t)

paratodoGen :: [a] -> (a -> Bool) -> Bool
paratodoGen xs t = cuantGen (&&) True xs t

-- paratodoGen [4, 2, 3] (>2)
-- False
-- paratodoGen [4, 2, 3] (>=2)
-- True

existeGen :: [a] -> (a -> Bool) -> Bool
existeGen xs t = cuantGen (||) False xs t

-- existeGen [2, 6, 3] (>2)
-- True
-- existeGen [2, 6, 3] (>7)
-- False

sumatoriaGen :: [a] -> (a -> Int) -> Int
sumatoriaGen xs t = cuantGen (+) 0 xs t

-- sumatoriaGen [] (+4)
-- 0
-- ghci> sumatoriaGen [2, 6, 10] (+4)
-- 30

productoriaGen :: [a] -> (a -> Int) -> Int
productoriaGen xs t = cuantGen (*) 1 xs t

-- productoriaGen [9, 4, 7] (+3)
-- 840
-- productoriaGen [2, 3, 5] (+1)
-- 72

-- Ejercicio 13)

distanciaEdicion :: [Char] -> [Char] -> Int
distanciaEdicion xs [] = length xs
distanciaEdicion [] ys = length ys
distanciaEdicion (x:xs) (y:ys)
  | x == y = distanciaEdicion xs ys
  | otherwise = 1 + (distanciaEdicion xs ys)

-- Ejercicio 14)

primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen ls p = takeWhile p ls

-- Ejercicio 15)

-- a)
-- Está bien tipado puesto que (a, b) es una tupla de dos elementos, no necesariamente del mismo tipo entre ellos. Al ser un argumento de tipo directo (es decir, no una lista), no hay casos explícitos por cubrir.

-- b)
-- Está mal tipado, puesto que [(a, b)] es una lista de tuplas de dos elementos, lo que provoca un error en la definición de la función. Además, al ser una lista debe considerarse el elemento neutro de listas []

-- c)
-- Está bien tipado, puesto que en la sintaxis (x:xs), "x" es una tupla (a, b) dentro de una lista de tuplas. A tener en cuenta, el caso en que tratemos de acceder a un elemento dentro de una ista vacía.

-- d)
-- Está mal tipado, debido a que si bien la sintaxis ((x, y):xs) es válida para las listas de tuplas, al desestructurar otra tupla, estamos obligando a la lista a tener al menos dos elementos, lo que podría ser contraproducente y generar problemas de patrones exhaustivos.

-- e)
-- Está mal tipado, debido que al definir f [(0, a)] estamos tomando en cuenta solo uno de los casos posibles que encajen en el tipo de la función, puesto que además de dejar solo a "a" como variable libre, permitimos sSOLO listas que sean de un elemento y que corresponda con (0, a).

-- f)
-- A diferencia del caso anterior, está bien tipado. Sin embargo, estamos perdiendo una de las variables al darle un valor estático de 1 a la variable libre "a". Además, se debe tomar en cuenta la lista vacía.

-- g)
-- Está bien tipado, debido a que ambas variables, si bien son de distinto tipo (una es una función y la otra un número entero), ninguna se restringe y permite la generalización de los casos posibles.

-- h)
-- Está bien tipado, sin embargo rompe con lo aclarado anteriormente puesto que liga una de las variables a un valor fijo y se pierde la generalización.

-- i)
-- Está mal tipado, debido a que involucra tres argumentos cuando en la declaración de tipos solo requiere dos. Tampoco se cumplen los tipos solicitados, puesto que "0 1" (si se tomara como primer argumento) no es una función, son dos números enteros.

-- Ejercicio 16)

-- a)
-- f :: (a, b) -> b
-- f (x, y) = b
-- ALT: en este caso no hay otra posibilidad más que devolver el segundo valor de la tupla.

-- b)
-- f :: (a, b) -> c
-- f (x, y) = x + y
-- ALT: en este caso podemos aplicar otras operaciones, como (*) o (-), siempre y cuando estén bien definidos los tipos de las variables.

-- c)
-- f :: (a -> b) -> a -> b
-- f t x = t x
-- ALT: en este caso solo cambiaría la sintaxis, puesto que la definición nos obliga a utilizar una función de transformación o validación

-- d)
-- f :: (a -> b) -> [a] -> [b]
-- f t xs = map t xs
-- ALT: en este caso, podríamos utilizar recursión en vez de la función map, pero al igual que en c) los requisitos de la función son claros.

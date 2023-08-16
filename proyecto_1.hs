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

paraTodo :: [Bool] -> Bool
paraTodo [] = True 
paraTodo (x:xs)
  | x == True = paraTodo xs
  | otherwise = False

-- paraTodo [True, True, False]
-- False
-- paraTodo [True, True, True]
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

paraTodo' :: [a] -> (a -> Bool) -> Bool
paraTodo' [] t = True
paraTodo' (x:xs) t
  | t x = paraTodo' xs t
  | otherwise = False

-- paraTodo' [4, 3, 2] esPositivo
-- True
-- paraTodo' [4, 3, (-2)] esPositivo
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
-- paraTodo' "aei" esVocal
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

paraTodo'' :: [Bool] -> Bool
paraTodo'' xs = paraTodo' xs (== True)

-- paraTodo'' [True, True, False]
-- False
-- paraTodo'' [True, True, True]
-- True

-- Ejercicio 6

-- a)

todosPares :: [Int] -> Bool
todosPares xs = paraTodo' xs even

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

esFib :: Int -> Bool
esFib n = existe' (map fib [0..n]) (== n)

-- esFib 11
-- False
-- esFib 34
-- True

-- i)

todosFib :: [Int] -> Bool
todosFib xs = paraTodo' xs esFib

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
-- duplicateEachElement: duplica cada elemento de una lista xs

-- a)

duplicateEachElement :: [Int] -> [Int]
duplicateEachElement [] = []
duplicateEachElement (x:xs) = (x * 2):(duplicateEachElement xs)

-- duplicateEachElement [2, 4, 6, 8]
-- [4,8,12,16]
-- duplicateEachElement [3, 6, 9, 12]
-- [6,12,18,24]

-- b)

duplicateEachElement' :: [Int] -> [Int]
duplicateEachElement' xs = map (*2) xs

-- duplicateEachElement' [5, 10, 15]
-- [10,20,30]
-- duplicateEachElement' [6, 12, 18]
-- [12,24,36]

-- Ejercicio 9
-- onlyPrimes: devuelve una lista solo con los primos de la lista xs

-- a)

onlyPrimes :: [Int] -> [Int]
onlyPrimes [] = []
onlyPrimes (x:xs)
  | esPrimo x = x:(onlyPrimes xs)
  | otherwise = onlyPrimes xs

-- onlyPrimes [2, 4, 7, 9, 11]
-- [2,7,11]
-- onlyPrimes [2, 3, 5, 9, 11, 15, 19]
-- [2,3,5,11,19]

-- b)

onlyPrimes' :: [Int] -> [Int]
onlyPrimes' xs = filter esPrimo xs

-- onlyPrimes' [1, 2, 7, 21, 23, 34]
-- [1,2,7,23]
-- onlyPrimes' [1, 7, 16, 31, 47, 51]
-- [1,7,31,47]

-- c)

multiplicaPrimos' :: [Int] -> Int
multiplicaPrimos' xs = productoria (onlyPrimes xs)

-- multiplicaPrimos' [2, 3, 5, 4, 8]
-- 30
-- multiplicaPrimos' [2, 6, 8, 4, 11]
-- 22


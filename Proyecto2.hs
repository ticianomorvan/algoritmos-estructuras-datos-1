-- Ejercicio 1

-- a)
data Carrera = Matematica | Fisica | Computacion | Astronomia

-- b)
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Ciencias de la Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

-- ghci> titulo Astronomia
-- "Licenciatura en Astronomia"
-- ghci> titulo Computacion
-- "Licenciatura en Ciencias de la Computacion"

-- c)
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
-- Ejercicio 2 a)
                  deriving (Show, Eq, Ord, Bounded)

-- d)
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

-- ghci> cifradoAmericano Do
-- 'C'
-- ghci> cifradoAmericano Sol
-- 'G'

-- Ejercicio 3

-- a)
minimoElemento :: Ord a => [a] -> a
minimoElemento (x:[]) = x
minimoElemento (x:y:xs)
  | x < y = minimoElemento (x:xs)
  | otherwise = minimoElemento (y:xs)

-- ghci> minimoElemento [4, 7, 2]
-- 2
-- ghci> minimoElemento [Re, Mi, Fa]
-- Re

-- b)
minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:[]) = x
minimoElemento' (x:y:xs)
  | x < y = minimoElemento' (x:xs)
  | otherwise = minimoElemento' (y:xs)


-- ghci> minimoElemento' ([] :: [Int])
-- 9223372036854775807
-- ghci> minimoElemento' ([] :: [Char])
-- '\1114111'

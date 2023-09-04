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

-- c)
-- ghci> minimoElemento [Fa, La, Sol, Re, Fa]
-- Re

-- Ejercicio 4

-- a)
type Altura = Int
type NumCamiseta = Int

data Zona = Arco | Defensa | Mediocampo | Delantera
            deriving Eq

data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha

type ManoHabil = PiernaHabil

data Deportista = Ajedrecista
                | Ciclista Modalidad
                | Velocista Altura
                | Tenista TipoReves ManoHabil Altura
                | Futbolista Zona NumCamiseta PiernaHabil Altura

-- b)
-- ghci> :t Ciclista 
-- Ciclista :: Modalidad -> Deportista

-- c)
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas ((Velocista a):ds) = 1 + contar_velocistas ds
contar_velocistas (d:ds) = contar_velocistas ds

-- ghci> contar_velocistas [Velocista 4, Velocista 4, Ajedrecista]
-- 2
-- ghci> contar_velocistas [Velocista 4, Ajedrecista]
-- 1


-- d)
contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] z = 0
contar_futbolistas ((Futbolista z n p a):ds) z'
  | z == z' = 1 + contar_futbolistas ds z'
  | otherwise = contar_futbolistas ds z'
contar_futbolistas (d:ds) z' = contar_futbolistas ds z'

-- ghci> contar_futbolistas [Futbolista Arco 13 Derecha 187, Futbolista Delantera 24 Izquierda 184, Ajedrecista, Velocista 194] Arco 
-- 1
-- ghci> contar_futbolistas [Futbolista Arco 13 Derecha 187, Futbolista Delantera 24 Izquierda 184, Velocista 194, Futbolista Delantera 48 Derecha 193] Delantera
-- 2

-- e)
esFutbolistaDeZona :: Zona -> Deportista -> Bool
esFutbolistaDeZona z' (Futbolista z n p a) = z == z'
esFutbolistaDeZona z' d = False

contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' ds z' = length (filter (esFutbolistaDeZona z') ds)

-- ghci> contar_futbolistas' [Futbolista Arco 13 Derecha 187, Futbolista Delantera 24 Izquierda 184, Velocista 194, Futbolista Delantera 48 Derecha 193] Delantera
-- 2
-- ghci> contar_futbolistas' [Velocista 183, Futbolista Arco 1 Izquierda 192, Ajedrecista] Arco
-- 1

-- Ejercicio 5

-- a)
sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

-- b)
data Alteracion = Bemol | Natural | Sostenido

-- c)
data NotaMusical = Nota NotaBasica Alteracion

-- d)
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nb a) =
  case a of
    Bemol -> valorNota - 1
    Sostenido -> valorNota + 1
    Natural -> valorNota
  where valorNota = sonidoNatural nb

-- ghci> sonidoCromatico (Nota Sol Bemol)
-- 6
-- ghci> sonidoCromatico (Nota Do Natural)
-- 0
-- ghci> sonidoCromatico (Nota Re Sostenido)
-- 3

-- e)
instance Eq NotaMusical
  where
      n1 == n2 = sonidoCromatico n1 == sonidoCromatico n2

-- ghci> (Nota Sol Bemol) == (Nota Fa Sostenido)
-- True
-- ghci> (Nota Re Sostenido) == (Nota Mi Sostenido)
-- False

-- f)
instance Ord NotaMusical
  where
      n1 <= n2 = sonidoCromatico n1 <= sonidoCromatico n2

-- ghci> (Nota Re Sostenido) <= (Nota Mi Sostenido)
-- True
-- ghci> (Nota Si Bemol) <= (Nota Do Sostenido)
-- False

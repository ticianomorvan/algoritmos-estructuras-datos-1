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
minimoElemento [x] = x
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
minimoElemento' [x] = x
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
            deriving (Eq, Show)

data TipoReves = DosManos | UnaMano
                 deriving Show

data Modalidad = Carretera | Pista | Monte | BMX
                 deriving Show

data PiernaHabil = Izquierda | Derecha
                   deriving Show

type ManoHabil = PiernaHabil

data Deportista = Ajedrecista
                | Ciclista Modalidad
                | Velocista Altura
                | Tenista TipoReves ManoHabil Altura
                | Futbolista Zona NumCamiseta PiernaHabil Altura
                deriving Show

-- b)
-- ghci> :t Ciclista 
-- Ciclista :: Modalidad -> Deportista

-- c)
contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0
contarVelocistas ((Velocista a):ds) = 1 + contarVelocistas ds
contarVelocistas (_:ds) = contarVelocistas ds

-- ghci> contarVelocistas [Velocista 4, Velocista 4, Ajedrecista]
-- 2
-- ghci> contarVelocistas [Velocista 4, Ajedrecista]
-- 1


-- d)
contarFutbolistas :: [Deportista] -> Zona -> Int
contarFutbolistas [] z = 0
contarFutbolistas ((Futbolista Arco n p a):ds) Arco = 1 + contarFutbolistas ds Arco
contarFutbolistas ((Futbolista Defensa n p a):ds) Defensa = 1 + contarFutbolistas ds Defensa
contarFutbolistas ((Futbolista Mediocampo n p a):ds) Mediocampo = 1 + contarFutbolistas ds Mediocampo
contarFutbolistas ((Futbolista Delantera n p a):ds) Delantera = 1 + contarFutbolistas ds Delantera
contarFutbolistas (_:ds) z' = contarFutbolistas ds z'

-- ghci> contarFutbolistas [Futbolista Arco 13 Derecha 187, Futbolista Delantera 24 Izquierda 184, Ajedrecista, Velocista 194] Arco 
-- 1
-- ghci> contarFutbolistas [Futbolista Arco 13 Derecha 187, Futbolista Delantera 24 Izquierda 184, Velocista 194, Futbolista Delantera 48 Derecha 193] Delantera
-- 2

-- e)
esFutbolistaDeZona :: Zona -> Deportista -> Bool
esFutbolistaDeZona z' (Futbolista z n p a) = z == z'
esFutbolistaDeZona z' d = False

contarFutbolistas' :: [Deportista] -> Zona -> Int
contarFutbolistas' ds z' = length (filter (esFutbolistaDeZona z') ds)

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

-- Ejercicio 6

-- a)
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

-- ghci> primerElemento [2, 4, 6]
-- Just 2
-- ghci> primerElemento "hola"
-- Just 'h'

-- Ejercicio 7

data Cola = VaciaC | Encolada Deportista Cola
            deriving Show

-- a)
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada _ restoDeLaCola) = Just restoDeLaCola

-- ghci> atender (Encolada Ajedrecista VaciaC)
-- Just VaciaC
-- ghci> atender (Encolada Ajedrecista (Encolada (Velocista 193) (Encolada (Futbolista Arco 19 Derecha 192) VaciaC)))
-- Justt (Encolada (Velocista 193) (Encolada (Futbolista Arco 19 Derecha 192) VaciaC)

-- b)
encolar :: Deportista -> Cola -> Cola
encolar deportista VaciaC = Encolada deportista VaciaC
encolar deportista (Encolada d c) = Encolada d (encolar deportista c)

-- ghci> encolar (Futbolista Arco 12 Derecha 182) VaciaC
-- Encolada (Futbolista Arco 12 Derecha 182) VaciaC
-- ghci> encolar (Futbolista Arco 12 Derecha 182) (Encolada Ajedrecista (Encolada (Velocista 175) VaciaC))
-- Encolada Ajedrecista (Encolada (Velocista 175) (Encolada (Futbolista Arco 12 Derecha 182) VaciaC))


-- c)
esFutbolista :: Deportista -> Bool
esFutbolista (Futbolista z n p a) = True
esFutbolista d = False

busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC z' = Nothing
busca (Encolada (Futbolista z n p a) c) z'
  | esFutbolistaDeZona z' d = Just d
  | otherwise = busca c z'
  where d = Futbolista z n p a
busca (Encolada d c) z' = busca c z'

-- ghci> busca (Encolada (Futbolista Delantera 18 Derecha 192) (Encolada Ajedrecista (Encolada (Ciclista Pista) VaciaC))) Arco
-- Nothing
-- ghci> busca (Encolada (Futbolista Mediocampo 18 Derecha 173) (Encolada (Futbolista Mediocampo 12 Izquierda 192) (Encolada (Velocista 182) VaciaC))) Mediocampo
-- Just (Futbolista Mediocampo 18 Derecha 173)

-- Ejercicio 8

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)
                     deriving Show

-- a)
-- Debemos instanciarla de la forma
type GuiaTelefonica = ListaAsoc String Int

-- Debido a que nosotros conocemos un dato (la dirección del domicilio) y queremos saber el número telefónico que le corresponde.

-- b)

-- 1)
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a b la) = 1 + la_long la

-- ghci> la_long (Nodo (10::Int) (5::Int) (Nodo (15::Int) (19::Int) Vacia))
-- 2
-- ghci> la_long Vacia
-- 0

-- 2)
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia Vacia = Vacia
la_concat Vacia la' = la'
la_concat (Nodo a b la) la' = Nodo a b (la_concat la la')

-- ghci> la_concat (Nodo "a" "b" Vacia) (Nodo "b" "c" (Nodo "c" "d" Vacia))
-- Nodo "a" "b" (Nodo "b" "c" (Nodo "c" "d" Vacia))
-- ghci> la_concat Vacia Vacia
-- Vacia
-- ghci> la_concat Vacia (Nodo "a" "b" Vacia)
-- Nodo "a" "b" Vacia
-- ghci> la_concat (Nodo "a" "b" Vacia) Vacia
-- Nodo "a" "b" Vacia

-- 3)
la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a b = Nodo a b Vacia
la_agregar (Nodo a b la) a' b'
  | a == a' = Nodo a b' la
  | otherwise = Nodo a b (la_agregar la a' b')

-- ghci> la_agregar (Nodo "a" "c" (Nodo "b" "c" Vacia)) "a" "b"
-- Nodo "a" "b" (Nodo "b" "c" Vacia)
-- ghci> la_agregar (Nodo "a" "c" (Nodo "b" "c" Vacia)) "c" "d"
-- Nodo "a" "c" (Nodo "b" "c" (Nodo "c" "d" Vacia))

-- 4)
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b la) = (a, b):(la_pares la)

-- ghci> la_pares (Nodo "a" "b" (Nodo "b" "c" Vacia))
-- [("a","b"),("b","c")]
-- ghci> la_pares (Nodo "a" "b" (Nodo "b" "c" (Nodo "c" "d" (Nodo "d" "e" Vacia))))
-- [("a","b"),("b","c"),("c","d"),("d","e")]

-- 5)
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia a = Nothing
la_busca (Nodo a b la) a'
  | a == a' = Just b
  | otherwise = la_busca la a'

-- ghci> la_busca (Nodo "a" "b" (Nodo "c" "d" (Nodo "x" "y" Vacia))) "x"
-- ghci> Just "y"
-- ghci> la_busca (Nodo "a" "b" (Nodo "c" "d" (Nodo "x" "y" Vacia))) "z"
-- Nothing

-- 6)
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar a Vacia = Vacia
la_borrar a' (Nodo a b la)
  | a' == a = la
  | otherwise = Nodo a b (la_borrar a' la)

-- ghic> la_borrar "x" (Nodo "a" "b" (Nodo "c" "d" Vacia))
-- Nodo "a" "b" (Nodo "c" "d" Vacia)
-- ghci> la_borrar "x" (Nodo "a" "b" (Nodo "c" "d" (Nodo "x" "y" Vacia)))
-- Nodo "a" "b" (Nodo "c" "d" Vacia)

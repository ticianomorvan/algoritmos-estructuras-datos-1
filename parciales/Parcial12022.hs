-- Ejercicio 1)

-- a)

data Forma = Piedra | Papel | Tijera

leGana :: Forma -> Forma -> Bool
leGana Piedra Tijera = True
leGana Piedra _ = False
leGana Papel Piedra = True
leGana Papel _ = False
leGana Tijera Papel = True
leGana Tijera _ = False

-- b)

type Nombre = String

data Jugador = Mano Nombre Forma

ganador :: Jugador -> Jugador -> Maybe Nombre
ganador (Mano n1 f1) (Mano n2 f2)
  | leGana f1 f2 = Just n1
  | leGana f2 f1 = Just n2
  | otherwise = Nothing

-- Ejercicio 2)

quienJugo :: Forma -> [Jugador] -> [Nombre]
quienJugo _ [] = []
quienJugo Piedra ((Mano n Piedra):js) = n:(quienJugo Piedra js)
quienJugo Papel ((Mano n Papel):js) = n:(quienJugo Papel js)
quienJugo Tijera ((Mano n Tijera):js) = n:(quienJugo Tijera js)
quienJugo f (_:js) = quienJugo f js

-- Ejercicio 3)

data NotaMusical = Do | Re | Mi | Fa | Sol | La | Si

data Figura = Negra | Corchea

data Melodia = Vacia | Entonar NotaMusical Figura Melodia

contarTiempos :: Melodia -> Int
contarTiempos Vacia = 0
contarTiempos (Entonar n f m) = case f of
  Negra -> 2 + contarTiempos m
  Corchea -> 1 + contarTiempos m

-- Ejercicio 4)

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)
  deriving Show

arbolSum :: Arbol Int -> Arbol Int -> Arbol Int
arbolSum Hoja Hoja = Hoja
arbolSum (Rama ai a ad) Hoja = Rama ai a ad
arbolSum Hoja (Rama ai' a' ad') = Rama ai' a' ad'
arbolSum (Rama ai a ad) (Rama ai' a' ad') = Rama (arbolSum ai ai') (a + a') (arbolSum ad ad')

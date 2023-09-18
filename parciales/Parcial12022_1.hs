-- Ejercicio 1)

data Palo = Espada | Basto | Oro | Copa

-- a)
mismoPalo :: Palo -> Palo -> Bool
mismoPalo Espada Espada = True
mismoPalo Espada _ = False
mismoPalo Basto Basto = True
mismoPalo Basto _ = False
mismoPalo Oro Oro = True
mismoPalo Oro _ = False
mismoPalo Copa Copa = True
mismoPalo Copa _ = False

-- b)

data Figura = Uno | Dos | Tres | Cuatro | Cinco | Seis | Siete | Sota | Caballo | Rey
  deriving Show

valorFigura :: Figura -> Int
valorFigura Uno = 1
valorFigura Dos = 2
valorFigura Tres = 3
valorFigura Cuatro = 4
valorFigura Cinco = 5
valorFigura Seis = 6
valorFigura Siete = 7
valorFigura Sota = 8
valorFigura Caballo = 9
valorFigura Rey = 10

data Carta = Naipe Figura Palo

sumaCartas :: Carta -> Carta -> Maybe Int
sumaCartas (Naipe f1 p1) (Naipe f2 p2)
  | mismoPalo p1 p2 = Just (valorFigura f1 + valorFigura f2)
  | otherwise = Nothing

-- Ejercicio 2)

compatibles :: Carta -> [Carta] -> [Figura]
compatibles c [] = []
compatibles (Naipe f1 p1) ((Naipe f2 p2):cs)
  | (mismoPalo p1 p2) && ((valorFigura f1 + valorFigura f2) < 15) = f2:(compatibles (Naipe f1 p1) cs)
  | otherwise = compatibles (Naipe f1 p1) cs

-- Ejercicio 3)

type Duracion = Int
type Nombre = String

data Cancion = Tema Nombre Duracion

data Estado = Escuchado | NoEscuchado

data Playlist = Vacia | Enlista Cancion Estado Playlist

tiempoReproduccion :: Playlist -> Int
tiempoReproduccion Vacia = 0
tiempoReproduccion (Enlista (Tema n1 d1) e p) = case e of
  Escuchado -> d1 + tiempoReproduccion p
  NoEscuchado -> tiempoReproduccion p

-- Ejercicio 4)

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)
  deriving Show

aPodar :: Arbol a -> Arbol a
aPodar (Rama Hoja a Hoja) = Hoja
aPodar (Rama Hoja a ad) = Rama Hoja a (aPodar ad)
aPodar (Rama ai a Hoja) = Rama (aPodar ai) a Hoja
aPodar (Rama ai a ad) = Rama (aPodar ai) a (aPodar ad)

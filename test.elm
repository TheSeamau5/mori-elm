import Text(asText)

import Mori.Vector as V

empty : V.Vector a
empty = V.empty

v1 : V.Vector Int
v1 = V.initialize (\index -> index * 2) 1000

v2 : V.Vector Int
v2 = V.map (\x -> x - 100) v1

v3 : V.Vector (V.Vector Int)
v3 = V.partition 3 v2

v4 : V.Vector Int
v4 = V.flatten v3

test1 = v2 `V.equals` v4
test2 = v2 `V.equals` (V.conj 1898 v4)

main = asText <| test1

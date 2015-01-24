# mori-elm

Port of [Mori](https://github.com/swannodette/mori) in Elm.

Currently supports vector.

# Usage

### Import Library

```elm
import Mori.Vector (..)
```

### Initialize Vector

```elm
v1 = initialize (\index -> index * 2) 1000
```

### Usual Collection operations

```elm
v2 = map (\x -> x * x) v1
v3 = partition 3 v2
v4 = flatten v3
v5 = mapcat (partition 4) v2
v6 = take 10 v2
v7 = sortBy (\a b -> b - a) v2
v8 = sort v7
v9 = interpose 4 v2
v10 = reverse v9
v11 = isEmpty v2
v12 = empty
v13 = initialize (\_ -> 1) 100
v14 = distinct v13 
```

module Mori.Vector where
{-| A port of Clojurescript's persistent vector using
    [Mori](http://swannodette.github.io/mori/).

Note: This port does not use laziness.

# Create
@docs initialize, empty

# Building Vectors
@docs push, conj, into, set, interpose, interleave

# Ranges
@docs range, interval, intervalWithStep

# Getters
@docs get, getWithDefault, find, first, rest, last

# Querying
@docs hasIndex, length, isEmpty, equals, some, every

# Filtering
@docs filter, remove, distinct, pop, take, takeWhile,
      drop, dropWhile

# mapReduce et al.
@docs map, flatMap, fold, foldKV, concat, flatten

# Paritioning
@docs parititon, partitionBy, subvec

# Sorting
@docs sort, sortWith, sortByKeyFn, sortByKeyFnWith

# Conversions
@docs toString, fromList

-}

import Native.Mori.Vector

type Vector a = Vector

{-| Add to the end of a vector -}
conj : a -> Vector a -> Vector a
conj = Native.Mori.Vector.conj

{-| Add to the end of a vector -}
push = conj

{-| Add all the items in the first collection
    to the second collection as if calling
    conj repeatedly.
-}
into : Vector a -> Vector a -> Vector a
into = Native.Mori.Vector.into

{-| Set a new value at an index. -}
set : Int -> a -> Vector a -> Vector a
set = Native.Mori.Vector.assoc

{-| Returns a vector of with the duplicates removed -}
distinct : Vector a -> Vector a
distinct = Native.Mori.Vector.distinct

{-| Empty vector -}
empty : Vector a
empty = Native.Mori.Vector.empty

{-| Retrieve a value from a vector at an index -}
get : Int -> Vector a -> Maybe a
get = Native.Mori.Vector.get

{-| Retrieve a value from a vector at an index
    if there is a value at that index. Else
    returns the provided default value.
-}
getWithDefault : Int -> Vector a -> a -> a
getWithDefault = Native.Mori.Vector.getWithDefault


{-| Check if a vector has a given index.
-}
hasIndex : Int -> Vector a -> Bool
hasIndex = Native.Mori.Vector.hasIndex


{-| Returns a key value pair as a tuple for a given
    index.
-}
find : Int -> Vector a -> Maybe (Int, a)
find = Native.Mori.Vector.find

{-| Get the last value in a vector, in linear time.
-}
last : Vector a -> Maybe a
last = Native.Mori.Vector.last

{-| Returns the length of the vector
-}
length : Vector a -> Int
length = Native.Mori.Vector.length

{-| Returns true if the vector is empty
-}
isEmpty : Vector a -> Bool
isEmpty = Native.Mori.Vector.isEmpty

{-| Returns a vector with the last item removed
-}
pop : Vector a -> Vector a
pop = Native.Mori.Vector.pop

{-| Returns a reversed vector
-}
reverse : Vector a -> Vector a
reverse = Native.Mori.Vector.reverse

{-| Returns a subsection of a vector in constant time.
-}
subvec : Int -> Int -> Vector a -> Vector a
subvec = Native.Mori.Vector.subvec

{-| Returns the first element in a vector
-}
first : Vector a -> Maybe a
first = Native.Mori.Vector.first

{-| Returns the remaining elements in a vector
-}
rest : Vector a -> Vector a
rest = Native.Mori.Vector.rest

{-| Test if two vectors are equal.
-}
equals : Vector a -> Vector b -> Bool
equals = Native.Mori.Vector.equals

{-| Append two vectors together.
-}
append : Vector a -> Vector a -> Vector a
append = Native.Mori.Vector.append

{-| Flatten a vector of vectors into a vector.
-}
flatten : Vector (Vector a) -> Vector a
flatten = Native.Mori.Vector.flatten

{-| Map a function over a vector.
-}
map : (a -> b) -> Vector a -> Vector b
map = Native.Mori.Vector.map

{-| Map a function that returns a vector over
    a vector and flatten the result.
-}
flatMap : (a -> Vector b) -> Vector a -> Vector b
flatMap = Native.Mori.Vector.flatMap

{-| Keep only the values that have passed the predicate.
-}
keepIf : (a -> Bool) -> Vector a -> Vector a
keepIf = Native.Mori.Vector.keepIf

{-| The inverse of keepIf.
    Drop only the values that have failed the predicate.
-}
dropIf : (a -> Bool) -> Vector a -> Vector a
dropIf = Native.Mori.Vector.dropIf

{-| Accumulate the vector into a single value.
-}
fold : (a -> b -> b) -> b -> Vector a -> b
fold = Native.Mori.Vector.fold

{-| A variant of fold that treats a vector as a map.

    f : String -> Int -> Int -> String
    f acc key val = acc ++ "(" ++ (toString key) ++ ":" ++ (toString val) ++ ")"

    v : Vector Int
    v = fromList [5,7]

    foldKV f "" v -- => "(0:5)(1:7)"
-}
foldKV : (b -> Int -> a) -> b -> Vector a -> b
foldKV = Native.Mori.Vector.foldKV

{-| Take n elements from a vector.
-}
take : Int -> Vector a -> Vector a
take = Native.Mori.Vector.take

{-| Take elements from a vector as long as the predicate
    returns True.
-}
takeWhile : (a -> Bool) -> Vector a -> Vector a
takeWhile = Native.Mori.Vector.takeWhile


{-| Drop n elements from a vector
-}
drop : Int -> Vector a -> Vector a
drop = Native.Mori.Vector.drop

{-| Drop elements from a vector as long as the predicate
    returns True
-}
dropWhile : (a -> Bool) -> Vector a -> Vector a
dropWhile = Native.Mori.Vector.dropWhile

{-| Returns the first result for which the predicate
    is True.
-}
some : (a -> Bool) -> Vector a -> Maybe a
some = Native.Mori.Vector.some

{-| Returns True if all elements in the vector
    satisfy the predicate.
-}
every : (a -> Bool) -> Vector a -> Bool
every = Native.Mori.Vector.every


{-| Sort the vector with a comparison function.

    f : Int -> Int -> Int
    f a b = b - a

    a = fromList [4,6,2,7,1,0,9,5,8,3]

    sortWith f a -- => [9 8 7 6 5 4 3 2 1 0]
-}
sortWith : (a -> a -> a) -> Vector a -> Vector a
sortWith = Native.Mori.Vector.sortWith


{-| Sort the vector.

    a = fromList [4,6,2,7,1,0,9,5,8,3]

    sort a -- => [0 1 2 3 4 5 6 7 8 9]
-}
sort : Vector comparable -> Vector comparable
sort = Native.Mori.Vector.sort


{-| Sorts the vector by the values of the key function
    on the elements.

    a = initialize indentity 7 -- => [0 1 2 3 4 5 6]

    keyFn : Int -> Int
    keyFn x = x * 5 % 7

    sortByKeyFn keyFn a -- => [0 3 6 2 5 1 4]
-}
sortByKeyFn : (a -> a) -> Vector a -> Vector a
sortByKeyFn = Native.Mori.Vector.sortByKeyFn


{-| Sorts the vector by the values of the key function
    on the elements and a comparison function.

    a = initialize indentity 7 -- => [0 1 2 3 4 5 6]

    keyFn : Int -> Int
    keyFn x = x * 5 % 7

    f : Int -> Int -> Int
    f a b = b - a

    sortByKeyFnWith keyFn f a -- => [4 1 5 2 3 6 0]
-}
sortByKeyFnWith : (a -> a) -> (a -> a -> a) -> Vector a -> Vector a
sortByKeyFnWith = Native.Mori.Vector.sortByKeyFnWith

{-| Interpose a value between all elements of a vector

    a = interval 1 4 -- => [1 2 3]

    interpose 8 a -- => [1 8 2 8 3]



-}
interpose : a -> Vector a -> Vector a
interpose = Native.Mori.Vector.interpose

{-| Interleave two vectors.

    ns = fromList [1 2 3]
    as = fromList [7 8 9]

    interleave ns as -- => [1 7 2 8 3 9]
-}
interleave : Vector a -> Vector a -> Vector a
interleave = Native.Mori.Vector.interleave

{-| Partition a vector into vectors of n items.
-}
partition : Int -> Vector a -> Vector (Vector a)
partition = Native.Mori.Vector.partition

{-| Parition a vector with a new vector being started
    whenever the value of the function changes
-}
partitionBy : (a -> b) -> Vector a -> Vector (Vector a)
partitionBy = Native.Mori.Vector.partitionBy

{-| Efficiently create a vector.

    -- Create a vector of 100000 elements
    -- that range from 1 to 100000
    initialize ((+) 1) 100000

    -- Create a vector of squares
    initialize (\x -> x * x) 100
-}
initialize : (Int -> a) -> Int -> Vector a
initialize = Native.Mori.Vector.initialize

{-| Convert a vector to a string. String representation
    matches that in Clojure(script).
-}
toString : Vector a -> String
toString = Native.Mori.Vector.toString

{-| Convert a list to a vector.
-}
fromList : List a -> Vector a
fromList = Native.Mori.Vector.fromList

{-| Create a range of integers from 0 to the
    given value.

    range 5 == initialize (\x -> x) 5
    -- => [0 1 2 3 4]
-}
range : Int -> Vector Int
range = initialize (\x -> x)

{-| Create an interval with a start (inclusive)
    and an end (exclusive)

    interval 1 5 -- => [1 2 3 4]
-}
interval : Int -> Int -> Vector Int
interval = Native.Mori.Vector.interval

{-| Create an interval, specifying a step.

    intervalWithStep 1 9 2 -- => [1 3 5 7]
-}
intervalWithStep : Int -> Int -> Int -> Vector Int
intervalWithStep = Native.Mori.Vector.intervalWithStep

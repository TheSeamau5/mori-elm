module Mori.Vector where

import Native.Mori.Vector

type Vector a = Vector

conj : a -> Vector a -> Vector a
conj = Native.Mori.Vector.conj

into : Vector a -> Vector a -> Vector a
into = Native.Mori.Vector.into

assoc : Int -> a -> Vector a -> Vector a
assoc = Native.Mori.Vector.assoc

distinct : Vector a -> Vector a
distinct = Native.Mori.Vector.distinct

empty : Vector a
empty = Native.Mori.Vector.empty

get : Int -> Vector a -> Maybe a
get = Native.Mori.Vector.get

getWithDefault : Int -> Vector a -> a -> a
getWithDefault = Native.Mori.Vector.getWithDefault

hasIndex : Int -> Vector a -> Bool
hasIndex = Native.Mori.Vector.hasIndex

find : Int -> Vector a -> Maybe (Int, a)
find = Native.Mori.Vector.find

last : Vector a -> Maybe a
last = Native.Mori.Vector.last

count : Vector a -> Int
count = Native.Mori.Vector.count

isEmpty : Vector a -> Bool
isEmpty = Native.Mori.Vector.isEmpty

pop : Vector a -> Vector a
pop = Native.Mori.Vector.pop

reverse : Vector a -> Vector a
reverse = Native.Mori.Vector.reverse

subvec : Int -> Int -> Vector a -> Vector a
subvec = Native.Mori.Vector.subvec

first : Vector a -> Maybe a
first = Native.Mori.Vector.first

rest : Vector a -> Vector a
rest = Native.Mori.Vector.rest

equals : Vector a -> Vector b -> Bool
equals = Native.Mori.Vector.equals

concat : Vector a -> Vector a -> Vector a
concat = Native.Mori.Vector.concat

flatten : Vector (Vector a) -> Vector a
flatten = Native.Mori.Vector.flatten

map : (a -> b) -> Vector a -> Vector b
map = Native.Mori.Vector.map

mapcat : (a -> Vector b) -> Vector a -> Vector b
mapcat = Native.Mori.Vector.mapcat

filter : (a -> Bool) -> Vector a -> Vector a
filter = Native.Mori.Vector.filter

remove : (a -> Bool) -> Vector a -> Vector a
remove = Native.Mori.Vector.remove

reduce : (a -> b -> b) -> b -> Vector a -> b
reduce = Native.Mori.Vector.reduce

reduceKV : (b -> Int -> a) -> b -> Vector a -> b
reduceKV = Native.Mori.Vector.reduceKV

take : Int -> Vector a -> Vector a
take = Native.Mori.Vector.take

takeWhile : (a -> Bool) -> Vector a -> Vector a
takeWhile = Native.Mori.Vector.takeWhile

drop : Int -> Vector a -> Vector a
drop = Native.Mori.Vector.drop

dropWhile : (a -> Bool) -> Vector a -> Vector a
dropWhile = Native.Mori.Vector.dropWhile

some : (a -> Bool) -> Vector a -> Maybe a
some = Native.Mori.Vector.some

every : (a -> Bool) -> Vector a -> Bool
every = Native.Mori.Vector.every

sortWith : (a -> a -> a) -> Vector a -> Vector a
sortWith = Native.Mori.Vector.sortWith

sort : Vector comparable -> Vector comparable
sort = Native.Mori.Vector.sort

sortByKeyFn : (a -> a) -> Vector a -> Vector a
sortByKeyFn = Native.Mori.Vector.sortByKeyFn

sortByKeyFnWith : (a -> a) -> (a -> a -> a) -> Vector a -> Vector a
sortByKeyFnWith = Native.Mori.Vector.sortByKeyFnWith

interpose : a -> Vector a -> Vector a
interpose = Native.Mori.Vector.interpose

interleave : Vector a -> Vector a -> Vector a
interleave = Native.Mori.Vector.interleave

partition : Int -> Vector a -> Vector (Vector a)
partition = Native.Mori.Vector.partition

partitionBy : (a -> b) -> Vector a -> Vector (Vector a)
partitionBy = Native.Mori.Vector.partitionBy

initialize : (Int -> a) -> Int -> Vector a
initialize = Native.Mori.Vector.initialize

toString : Vector a -> String
toString = Native.Mori.Vector.toString

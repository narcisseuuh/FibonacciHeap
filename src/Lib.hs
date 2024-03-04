module Lib
    (insert, findMin, deleteMin) where

data Tree a = Empty | Node (Tree a) a (Tree a)
    deriving Show

type FibHeap a = [Tree a]

insert :: a -> FibHeap a -> FibHeap a
insert = error "todo"

findMin :: FibHeap a -> a
findMin = error "todo"

deleteMin :: FibHeap a -> FibHeap a
deleteMin = error "todo"
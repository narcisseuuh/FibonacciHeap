module Lib where

data Tree a = Node { rank :: Int, root :: a, children :: [Tree a] } deriving (Eq, Show)

data FibHeap a = Empty | FH { size :: Int, minTree :: Tree a, trees :: [Tree a] } deriving (Eq, Show)

-- some preliminary function
create :: a -> FibHeap a
create x = FH 1 (Node 1 x []) []

mergeTrees :: (Ord a) => Tree a -> Tree a -> Tree a
-- making the assumption that they have the same rank
mergeTrees h1@(Node r x child1) h2@(Node _ y child2)
    | x < y = Node (r + 1) x (h2:child1)
    | otherwise = Node (r + 1) y (h1:child2)

mergeSameRanks :: (Ord a) => [Tree a] -> [Tree a]
mergeSameRanks =
    foldl doWeMerge []
    where
        doWeMerge [] t = [t]
        doWeMerge (x:xs) t =
            if rank x == rank t then doWeMerge xs (mergeTrees x t)
            else t:x:xs

getMinTree :: (Ord a) => [Tree a] -> (Tree a, [Tree a])
getMinTree [] = error "no min..."
getMinTree [t] = (t, [])
getMinTree (x:xs) =
    let (x',xs') = getMinTree xs in
        if root x' < root x then (x', x:xs')
        else (x, xs)

-- required primitives :
insert :: (Ord a) => a -> FibHeap a -> FibHeap a
insert x h =
    mergeHeaps h (create x)
    where
    mergeHeaps h Empty = h
    mergeHeaps Empty h = h
    mergeHeaps h1@(FH size1 min1 t1) h2@(FH size2 min2 t2)
        | root min1 < root min2 = FH (size1 + size2) min1 (min2:t2++t1)
        | otherwise = FH (size1 + size2) min2 (min1:t1++t2)

findMin :: (Ord a) => FibHeap a -> a
findMin = root . minTree

deleteMin :: (Ord a) => FibHeap a -> FibHeap a
deleteMin Empty = Empty
deleteMin (FH _ (Node _ _ []) []) = Empty
deleteMin (FH size min ts) =
    let (newMin, ts') = getMinTree . mergeSameRanks $ children min ++ ts in
        FH (size - 1) newMin ts'

isEmpty :: FibHeap a -> Bool
isEmpty Empty = True
isEmpty _ = False
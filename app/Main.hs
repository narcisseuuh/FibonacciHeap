module Main (main) where

import Lib

main :: IO ()
main =
   let heap = foldr insert Empty [5, 3, 7, 1, 9, 4] in
   let heapDelete = deleteMin heap in
      do putStrLn "Heap after some insertions :"
         print heap
         putStrLn "Heap after deleting a minimum :"
         print heapDelete

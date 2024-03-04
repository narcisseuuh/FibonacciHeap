module Main (main) where

import Lib (insert, findMin, deleteMin)

main :: IO ()
main =
   let heap = foldr insert [] [5, 3, 7, 1, 9, 4] in
   let heapDelete = deleteMin heap in
      do putStrLn "Heap after some insertions :"
         print heap
         putStrLn "Heap after deleting a minimum :"
         print heapDelete

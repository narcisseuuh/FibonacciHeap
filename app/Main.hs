module Main (main) where

import Lib

main :: IO ()
main =
   let heap = foldr insert [] [5, 3, 7, 1, 9, 4] in
      print heap

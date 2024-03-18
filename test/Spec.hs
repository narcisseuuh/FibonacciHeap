module Main where

import Lib

-- A simple assertion function that checks if a condition is True. If it's not, it prints a given message.
assert :: Bool -> String -> IO ()
assert True _ = return ()
assert False msg = putStrLn $ "Assertion failed: " ++ msg

-- Tests for `insert` and `findMin`
testInsertAndFindMin :: IO ()
testInsertAndFindMin = do
  let heap1 = create 10
  let heap2 = insert 5 heap1
  let heap3 = insert 20 heap2
  let min1 = findMin heap1
  let min2 = findMin heap2
  let min3 = findMin heap3
  
  assert (min1 == 10) "findMin after single insert failed."
  assert (min2 == 5) "findMin after inserting smaller element failed."
  assert (min3 == 5) "findMin after inserting larger element failed."
  putStrLn "Passed all insert and findMin tests."

-- Tests for `deleteMin`
testDeleteMin :: IO ()
testDeleteMin = do
  let heap1 = create 10
  let heap2 = insert 5 heap1
  let heap3 = deleteMin heap2
  let heap4 = deleteMin heap3
  
  assert (not (isEmpty heap2)) "heap2 should not be empty."
  assert (isEmpty heap4) "heap4 should be empty after deleting the min element."
  putStrLn "Passed all deleteMin tests."

main :: IO ()
main = do
  testInsertAndFindMin
  testDeleteMin
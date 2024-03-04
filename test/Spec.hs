import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck
import Lib

main :: IO ()
main = hspec $ do
  describe "Fibonacci Heap properties" $ do
    describe "insert and findMin" $ do
      prop "inserting a single element and finding the minimum should return that element" $
        \x -> findMin (insert x ([] :: FibHeap Int)) == x

    describe "insert, deleteMin and isEmpty" $ do
      prop "inserting an element and then deleting it should result in an empty heap" $
        \x -> null (deleteMin (insert x ([] :: FibHeap Int)))
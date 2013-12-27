import Control.Monad
import Data.Array
import Data.List
buildCountArr = listArray ((0,0), (2000,1000))  [count' i j | i <- [0..2000], j <- [0..1000]]
count' i j = if (j==0) || (j == i) then 1 else (buildCountArr ! (i-1,j-1)) + (buildCountArr ! (i-1,j))
main = do
  num <- readLn :: IO Int
  forM_ [1..num] $ const $ do
    n <- readLn :: IO Int
    k <- readLn :: IO Int
    putStrLn $ show $ buildCountArr ! (n+k-1,k) 

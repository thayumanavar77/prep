import Control.Monad
import Data.Array
import Data.List
buildCountArr = listArray ((0,0), (1000,1000))  [count' i j | i <- [0..1000], j <- [0..1000]]
count' i j = if (j==0) || (j == i) then 1 else buildCountArr ! (i-1,j-1) + buildCountArr ! (i-1,j)
ncr_table n = map (\x -> (buildCountArr ! (n,x)) `mod` 10^9) [0..n]
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    n1 <- readLn :: IO Int
    putStrLn $ intercalate " " $ map (show) (ncr_table n1) 

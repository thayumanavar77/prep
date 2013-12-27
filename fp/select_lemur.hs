import Control.Monad
import Data.Array 
countr :: Int -> Int -> Int
countr n k = if (k==n) || (k==0) then 1 else (countr (n-1) (k-1)) + (countr (n-1) k)
buildCountArr = listArray ((0,0), (1000,1000)) [count' i j | i <- [0..1000], j <- [0..1000]]
count' i j = if (j == 0) || (j == i) then 1 else buildCountArr ! (i-1,j-1) + buildCountArr ! (i-1,j)
count n k = countarr ! (n, k) where
                       countarr :: Array (Int, Int) Int
                       countarr = listArray ((0,0), (n,n)) [count' i j | i <- [0..n], j <- [0..n]]
                       count' i j = if (j == 0) || (j == i) then 1 else countarr ! (i-1,j-1) + countarr ! (i-1,j)
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    xs <- fmap (map (read::String->Int) . words) getLine
    putStrLn $ show $ buildCountArr ! ((xs!!0),(xs!!1)) `mod` (10^8+7)

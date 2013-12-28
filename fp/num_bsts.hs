import Control.Monad
import Data.Array
import Data.List
buildCountArray = listArray (0,1000) [c i | i <- [0..1000]]
c 0 = 1
c i = sum [f i j | j <- [0..i]] 
f i j = if j == 0 then 1 else (f i (j-1))*(f i (i - j))
main = do
  num <- readLn :: IO Int
  forM_ [1..num] $ const $ do
    n <- readLn :: IO Int
    putStrLn $ show $ (buildCountArray ! n)


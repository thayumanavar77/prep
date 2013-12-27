import Control.Monad
import Data.Array
buildFibArray = array (0, 10000) [(i, fib i) | i <- [0..10000]]
fib 0 = 0
fib 1 = 1
fib n = (buildFibArray ! (n-1)) + (buildFibArray ! (n-2))
fibo n = farr ! n where
         farr = array (0, n) [(i, fib i) | i <- [0..n]]
         fib 0 = 0
         fib 1 = 1
         fib n = (farr ! (n-1)) + (farr ! (n-2)) 
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    fn <- readLn :: IO Int
    putStrLn $ show $ (buildFibArray ! fn) `mod` (10^8+7)

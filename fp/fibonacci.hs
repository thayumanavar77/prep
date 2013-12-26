import Control.Monad
import Data.Array
fibo n = farr ! n where
         farr = array (0, n) [(i, fib i) | i <- [0..n]]
         fib 0 = 0
         fib 1 = 1
         fib n = (farr ! (n-1)) + (farr ! (n-2)) 
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    fn <- readLn :: IO Int
    putStrLn $ show $ fibo fn `mod` (10^8+7)


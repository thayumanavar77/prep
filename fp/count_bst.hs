import Control.Monad
import Data.Array
import Data.List
cbstarr = array (0,101) [(i, countways i) | i <- [0..101]]
countways i = if i == 0 then 1 else foldl' (\x y -> x + (cbstarr ! (y-1)) *(cbstarr ! (i-y))) 0 [1..i]
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    c <- readLn :: IO Int
    putStrLn $ show $ (cbstarr ! c) `mod` (10^8+7)

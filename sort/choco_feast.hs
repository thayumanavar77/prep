import Control.Monad
import Data.List
import Debug.Trace
num_choco b c m = fst ((take 1 (dropWhile f xs))!!0)
                  where
                    f x = snd x >= m
                    f' x = (fst x + snd x `div` m, (snd x `div` m) + (snd x `mod` m))
                    xs = iterate f' (b `div` c, b `div` c)
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    ys <- fmap (map (read::String -> Int) . words) getLine
    putStrLn $ show $ num_choco (ys!!0) (ys!!1) (ys!!2)

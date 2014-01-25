import Control.Monad
import Data.List as L
import Data.Vector as V hiding(forM_)
findMin xv i1 i2 = V.foldl' (\x y -> if x < y then x else y) 4 (slice i1 (i2-i1+1) xv) 
main = do
  ns <- fmap (L.map (read::String -> Int) . words) getLine
  xs <- fmap (L.map (read::String -> Int) . words) getLine
  let xv = fromList xs
  forM_ [1..ns!!1] $ const $ do
    ys <- fmap (L.map (read::String -> Int) . words) getLine
    putStrLn $ show $ findMin xv (ys!!0) (ys!!1) 

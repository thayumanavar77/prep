import Control.Monad (forM_)
import Data.List (sort)
comb :: [Char] -> [[Char]]
comb [] = [[]]
comb (y:ys) = map (y:) (comb ys) ++ comb ys

combi [] = []
combi (y:ys) = ys

main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    n1 <- readLn :: IO Int
    linedata <- getLine
    mapM_ putStrLn $ combi $ sort $ comb $ linedata

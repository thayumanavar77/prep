import Control.Monad

str_permute [] = []
str_permute (x:x':xs) = x':x:str_permute xs

main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    xs <- getLine
    putStrLn $ str_permute xs 

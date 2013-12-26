import Control.Monad
import Text.Printf
factorial 0 = 1
factorial n = n * factorial (n-1)

eexpan x = foldr (term) 1 [1..9]
           where term x' y = ((x ** x') / (factorial x')) + y
main = do
  n <- readLn :: IO Int
  xs <- replicateM n (readLn :: IO Double)
  mapM_ (putStrLn . printf "%.4f")  $ map (eexpan) xs 

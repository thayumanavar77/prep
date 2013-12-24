import Control.Monad
diwali_lights :: Integer -> Integer
diwali_lights n = ((2^n)-1) `mod` 100000
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    n1 <- readLn :: IO Integer
    putStrLn $ show $ diwali_lights n1

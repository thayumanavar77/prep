import Control.Monad
handshake n = (n*(n-1)) `div` 2
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    n1 <- readLn :: IO Int
    putStrLn $ show $ handshake n1

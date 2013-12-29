import Control.Monad
import Data.List as L hiding (foldl')
import Data.Vector as V hiding (forM_, map)
import Text.Printf (printf)

ev :: Double -> Vector Int -> Double
ev n yv = (n+1) * (ifoldl' (sumex) 0 yv)
            where
              sumex :: Double -> Int -> Int -> Double
              sumex acc ind x = acc + (1 / (fromIntegral $ ((ifoldl' (\c ind' y -> if y >= x  then 1 + c else c) 0 yv) + 1)))
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    c <- readLn :: IO Double
    xs <- fmap (map (read :: String->Int) . words) getLine
    printf "%.2f\n" $ ev c (fromList xs) 

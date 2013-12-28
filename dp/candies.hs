import Control.Monad
import Data.List as L
import Data.Vector as V hiding (forM_, map)

min_candies n xv = L.foldl' (calc_min_candies) 0 [0..n-1]
                 where
                  lv = generate (n) (fl)
                  fl 0 = 1
                  fl i = if (xv ! (i-1)) < (xv ! i) then 1 + (lv ! (i-1)) else 1
                  rv = generate (n) (fr)
                  fr i | i == n-1 = 1
                       | (xv ! (i+1)) < (xv ! i) = 1 + (rv ! (i+1))
                       | otherwise = 1
                  calc_min_candies acc ind = acc + max (rv ! ind) (lv ! ind) 
main = do
  n <- readLn :: IO Int
  xs <- fmap (map (read :: String->Int) . lines) getContents
  putStrLn $ show $ min_candies n (fromList xs)

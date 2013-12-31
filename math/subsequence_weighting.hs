import Control.Monad
import Data.Vector as V hiding (forM_, map)
import Data.List as L
max' xs = if xs == [] then 0 else L.maximum  xs
max_subsequence_weight n xv = dp
                              where
                                dp = generate (n) (calc_weight)
                                calc_weight index | index == 0 = fst (xv ! 0)
                                                  | otherwise = fst ( xv ! index) + max'  [(dp ! j)  | j <- [0..index-1], snd (xv ! j) < snd (xv ! index)] 
main = do
       num <- readLn :: IO Int
       forM_ [1..num] $ const $ do
           n <- readLn :: IO Int
           as <- fmap (map (read:: String -> Int) . words) getLine
           ws <- fmap (map (read:: String -> Int) . words) getLine
           putStrLn $ show $ V.maximum $ max_subsequence_weight n (fromList (L.zip ws as))

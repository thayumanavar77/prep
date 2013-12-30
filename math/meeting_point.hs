import Control.Monad
import Data.List
f [x,y] = (x,y)
f l = error $ "Unexpected list: " ++ show l
f' [] = []
f' (x:y:ys) = (x,y):f' ys

time_spent h1 h2 = max (abs (fst h1 - fst h2)) (abs (snd h1 - snd h2))
euclid_dist h1 h2 = let
                      xsq = (fst h1 - fst h2) ^ 2
                      ysq = (snd h1 - snd h2) ^ 2
                    in   
                      sqrt (xsq + ysq)
meeting_point' :: Int -> [(Double, Double)] -> Double
meeting_point' n xs = let
                      median = let c = foldl' (\s e -> (fst s + fst e, snd s + snd e)) (0,0) xs
                               in ((fst c)/2, (snd c)/2)
                      sortp (x1,y1) (x2,y2) = compare (euclid_dist (x1,y1) median) (euclid_dist (x2,y2) median)
                      sortxs = sortBy (sortp) xs
                      time_to_point :: (Double,Double) -> Double
                      time_to_point p = foldl' (\tacc p' -> tacc + (time_spent p p')) 0 (take (min 1000 n) xs) 
                      find_min_time :: Double->(Double,Double)->Double
                      find_min_time min_time p = let x = time_to_point p in if x < min_time  then x else min_time
                      in
                        foldl' (find_min_time) (10^9) sortxs  
meeting_point xs = foldl' (find_min_time) maxBound xs
                   where
                    time_to_point p = foldl' (\tacc p' -> tacc + (time_spent p p')) 0 xs
                    find_min_time min_time p = let x = time_to_point p in if x < min_time  then x else min_time
                                             
main = do
  n <- readLn :: IO Int
  xs <- fmap (map (read :: String -> Double) . concat . map (words) . lines) getContents
{-  points <- fmap f' xs -}
  let points = f' xs
{-  mapM_ putStrLn $ map show $ points  -}
  putStrLn $ show $ round $ meeting_point' n points 

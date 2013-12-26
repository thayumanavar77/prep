--quicksort :: [Int] -> [[Int]]
quicksort [] = []
quicksort (x:xs) = quicksort (filter (< x) xs) ++ [x] ++ quicksort (filter (>= x) xs)

main = do
  n <- readLn :: IO Int
  xs <- fmap (map (read :: String -> Int) . words) getLine
  putStrLn $ show $ quicksort xs  

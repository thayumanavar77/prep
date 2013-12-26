partition (p:xs) = (filter (< p) xs) ++ [p] ++ (filter (> p) xs)
main = do
  n <- readLn :: IO Int
  xs <- fmap (map (read :: String -> Int) . words) getLine
  putStrLn $ unwords $ map show $ partition xs

pascal n = take n $ iterate (\xs -> zipWith (+) ([0] ++ xs) (xs ++ [0])) [1]
main = do
  n <- readLn :: IO Int
  mapM_ putStrLn $ map (\x -> unwords $ map show x) $ pascal n  

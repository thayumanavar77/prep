f s n | s == 0 = 1
      | s > 0 && n == 0 = 0
      | otherwise = foldr (+) 0 $ map (\x->(f s-x n-1)) [0..s]

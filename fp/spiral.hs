spiral :: Int -> Int -> Int -> Int
spiral 0 j n = n*n - 1 - j
spiral i j n
       | j == (n-1) = n*n - n - i
       | otherwise = 

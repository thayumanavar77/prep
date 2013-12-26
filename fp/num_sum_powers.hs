ways_sum s p = ways_sum' s p 1
               where ways_sum' s p j | s==0 = 1
                                     | s < 0 = 0
                                     | j >= s = 0
                                     | otherwise = foldr (+) 0 $ map (\x->(ways_sum'(s-(x^p))  p (x+1))) [j..s]  
main = do
        s <- readLn :: IO Int
        p <- readLn :: IO Int
        putStrLn $ show s
        putStrLn $ show p

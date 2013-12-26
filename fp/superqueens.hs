squeens :: Int -> Int
squeens n= squeens' 0 []
            where squeens' :: Int -> [Int] -> Int
                  squeens' num xs | num == n = 1
                                  | otherwise = foldr (+) 0 $ map (countSol) [0..n-1]
                                       where countSol :: Int -> Int 
                                             countSol x = if (isValid xs x (num))
                                                          then
                                                            squeens' (num+1) (xs ++ [x])
                                                          else
                                                            0
                                             isValid  xs ncol nrow = let
                                                                     validPlace (r',c') | c' == ncol = False
                                                                                   | abs(c'-ncol)  == (nrow-r') = False
                                                                                   | abs(c'-ncol) == 1 && (nrow-r') == 2 = False
                                                                                   | abs(c'-ncol) == 2 && (nrow-r') == 1 = False
                                                                                   | otherwise = True 
                                                                     in 
                                                                     and $ map (validPlace) $ zip [0..length xs] xs
                                                      
main = do
  n <- readLn :: IO Int
  putStrLn $ show $ squeens n 

f = (\xs -> foldr (+) 0  $ filter (\x -> x `mod` 2 == 1) xs)

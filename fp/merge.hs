merge :: [Int] -> [[Int]]
merge [] = []
merge (x:xs) = (l ++ [x] ++ r) : (merge l ++ [x] ++ merge r)
                where l = (filter (< x) xs)
                      r = (filter (>= x) xs)

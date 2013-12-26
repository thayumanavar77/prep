gcd' :: Int->Int->Int
gcd' n m = gcd'' (abs n) (abs m) where
            gcd'' n 0 = n
            gcd'' n m = gcd'' m (n `mod` m)

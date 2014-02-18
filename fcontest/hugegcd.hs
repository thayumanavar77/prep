import Data.List
modu=10^9+7
hugegcd xs ys = hgcd' xs ys 
                where
                  hgcd' (x:xs') ys' = let
                                         (g',nl) = ngcd x ys'
                                      in
                                        (g'* (hgcd' xs' nl)) `mod` modu
                  hgcd' [] ys' = 1 
                  ngcd x (y:ys') = let
                                       g = gcd x y 
                                       r = ngcd (x `div` g) ys'
                                   in 
                                       ((g * fst r) `mod` modu , (y `div` g) : snd r)
                  ngcd x [] = (1,[])

main = do
  xl <- readLn :: IO Int
  xs <- fmap (map (read::String -> Int) . words) getLine
  yl <- readLn :: IO Int
  ys <- fmap (map (read::String -> Int) . words) getLine
  putStrLn $ show $ hugegcd xs ys

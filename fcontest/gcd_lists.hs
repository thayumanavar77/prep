import Control.Monad (forM_)
import Data.List
gcd' [] _  = [] 
gcd' (_:[]) _ = [] 
gcd' l1 [] = [] 
gcd' (p1:n1:xs') (p2:n2:ys') | p1 == p2 = [p1, min n1 n2] ++ gcd' xs' ys'
                             | p1 < p2 = gcd' xs' (p2:n2:ys')
                             | otherwise = gcd' (p1:n1:xs') ys'
gcd_lists [] = []
gcd_lists (_:[]) = []
gcd_lists (xs:ys:[]) = gcd' xs ys
gcd_lists (xs:xss') = gcd' xs (gcd_lists xss')
gcd_lists' [] = []
gcd_lists' (_:[]) = []
gcd_lists' (xs:ys:xss') = let 
                            ns1 = gcd' xs ys
                            ns2 = gcd_lists' xss'
                          in
                            if ns2 == [] then ns1 else gcd' ns1 ns2
main = do
  n <- readLn :: IO Int
  ys <- fmap (lines) getContents
  let xs = fmap (map (read::String->Int) . words) ys
  putStrLn $ intercalate " " $ map (show) $ gcd_lists' xs
    

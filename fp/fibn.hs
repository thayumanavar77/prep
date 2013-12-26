module Main where

fib n = fib' (n-1) (0,1)
          where fib' n (acc1, acc2) | n == 0 =  acc1
                                    | otherwise = fib' (n-1) (acc2, acc1+acc2)
main = do
  input <- getLine
  print . fib . (read :: String -> Int) $ input

import Data.List (foldl')
str_red1 ys = foldl' (newstr) [] ys
              where
                newstr xs y | any (==y) xs == True = xs
                            | otherwise = xs ++ [y] 
main = do
  str <- getLine
  putStrLn $ str_red1 str

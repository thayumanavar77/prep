insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x ys'@(y:ys)
        | x > y = y : insert x ys
        | otherwise = x:ys'
ins :: [Int] -> [[Int]]
ins (x:xs) = let
              insrec [] ys = []
              insrec (x:xs) ys =  (inst ++ xs) : insrec xs inst 
                where inst = insert x ys
              in insrec xs [x]       
main = do
  n <- readLn :: IO Int
  xs <- fmap (map (read :: String -> Int) . words) getLine
  mapM_ putStrLn $ map (\x -> unwords $ map show x) $ ins xs

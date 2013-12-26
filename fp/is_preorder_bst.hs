import Control.Monad
is_preorder_bst :: [Int] -> Int -> Bool
is_preorder_bst ps n = is_preorder_bst' ps 0 (n+1)
                       where
                       ltrl key xs = takeWhile (<=key) xs
                       rtrl key xs = dropWhile (<=key) xs
                       is_preorder_bst' [] low high = True
                       is_preorder_bst' (key:xs) low high
                            | low < key  && key < high = is_preorder_bst' (ltrl key xs) low key && is_preorder_bst' (rtrl key xs) key high
                            | otherwise = False
yesNo True = "YES"
yesNo False = "NO"
main = do
       n <- readLn :: IO Int
       forM_ [1..n] $ const $ do
        n1 <- readLn :: IO Int
        xs <- fmap (map (read::String->Int) . words) getLine
        putStrLn $ yesNo $ is_preorder_bst xs (n1+1)

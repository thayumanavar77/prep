is_preorder_bst :: [Int] -> Int -> Bool
is_preorder_bst ps n = is_preorder_bst' ps!!0 0 n+1
                       where
                       is_preorder_bst' key low high
                          | low < key && key < high = True 
                          | otherwise = False 

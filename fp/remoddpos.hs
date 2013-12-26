f lst = case lst of
        [] -> []
        [x] -> []
        (x:y:xs) -> [y] ++ f xs

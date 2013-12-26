rev l = case l of
          [] -> []
          (x:xs) -> rev xs ++ [x]

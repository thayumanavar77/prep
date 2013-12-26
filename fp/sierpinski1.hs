sierpinski 0 = ["1"]
sierpinski n = map ((space ++) . (++ space)) down ++
               map (unwords . replicate 2) down
                   where down = sierpinski (n - 1)
            space = replicate (2 ^ (n - 1)) '_ '
             
            main = mapM_ putStrLn $ sierpinski 4

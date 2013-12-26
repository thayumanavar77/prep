r= 32 
c= 63 

createTri sr s p = map (tri) [0..(r-1)]
                    where underscore n= replicate n '_'
                          ones n= replicate n '1'
                          tri x | x>=sr && x < (sr+s)= underscore nuscore1 ++ ones nones ++ underscore nuscore
                                | otherwise= underscore c 
                                where nones = 2*(x-sr)+1
                                      nuscore1 = p-(x-sr)
                                      nuscore = (c-(nuscore1+nones))
sierpinski n = sierpinski' n 0 r (c `div` 2)
                where sierpinski' n sr s p | n == 0 = createTri sr s p
                                           | otherwise = zipWith (concatTri) (sierpinski' (n-1) sr hs p)
                                                       $ zipWith (concatTri) (sierpinski' (n-1) (sr+hs) hs (p-hs)) 
                                                                             (sierpinski' (n-1) (sr+hs) hs (p+hs))
                                                       where concatTri x y = zipWith (\x'->(\y'-> if x' == '_' && y' == '_' then '_' else '1')) x y
                                                             hs = s `div` 2 
                                                                            
main = do
  n <- readLn :: IO Int
  mapM_ putStrLn $ sierpinski n 

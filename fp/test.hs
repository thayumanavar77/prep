sum1 x p = psum x p nlist
                where nlist = [1..x]
                      psum x p  xs@(y:ys) | x==0 = 1 
                                          | xs==[] = 0
                                          | x<0 = 0
                                          | otherwise = psum (x-(y^p)) p ys 


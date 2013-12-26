sum s p =  sum' s p nlist 
           where sum' s p xs@(y:ys) | 0 p xs = 1
                                    | s p [] = 1 
                                    | s p (y:ys) = 1
                 nlist= [1..s]                   

x=[1,2,3]
y=[3,2,1]
z=[1,2,3]
nz= zipWith (+) x' 
    $ zipWith (+) y 
                  z
    where x' = map (\t->t) x 

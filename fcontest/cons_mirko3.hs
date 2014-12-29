import Control.Monad (forM_)
import Data.List as L
import Data.Ord
import Data.Set as S
import Data.Vector as V hiding (forM_)
import Debug.Trace
newtype Stack d = Stack [d] deriving (Eq, Show, Read)

type Build = (Int,((Int,Int),Int)) 
 
emptyStack :: Stack d
emptyStack = Stack []

isEmpty :: Stack d -> Bool
isEmpty (Stack []) = True
isEmpty _ = False

push :: d -> Stack d -> Stack d
push x (Stack xs) = Stack (x:xs)

pop :: Stack d -> Stack d
pop (Stack []) = error "empty stack"
pop (Stack (x:xs)) = Stack xs

top :: Stack d -> d
top (Stack []) = error "empty stack"
top (Stack (x:xs)) = x

--tstolist :: Stack d -> Set d 
tstolist (Stack y) =  S.fromList y
tstovector (Stack y) = V.fromList (L.reverse y)

cmpfn' ((b1,f1),_) ((b2,f2),_)
  | b1 < b2 = LT
  | b1 > b2 = GT
  | b1 == b2 = compare f1 f2 
cmpfn ((b1,f1),_) ((b2,f2),_)
  | f1 < f2 = LT
  | f1 > f2 = GT
  | f1 == f2 = compare b1 b2 
prebuild bd = L.foldl' (pb) emptyStack bd
              where
              pb :: Stack Build -> ((Int,Int),Int) -> Stack Build
              pb ts v@((b,f),idx)
                | isEmpty ts = push (0,v) ts
                | otherwise = let
                                (tt,((bt,ft),idxt)) = top ts
                                te = if bt >= b && f > ft then ((bt - b) `div` (f - ft)) else 0
                                --te'= if idxt <  idx then te else te+1
                                ns = if te <= tt 
                                     then 
                                      (pb (pop ts) v) 
                                     else 
                                      push (te,v) ts
                              in 
                                ns
inf :: Int
inf = 10^7

daye :: Build -> Int
daye (t,((_,_),_)) = t
dayi :: Build -> Int
dayi (_,((_,_),idx)) = idx

tallest_build bs fs d ={--(trace $ show $ zip (zipWith (\f b -> f+d*b) bs fs) [1..]) $--} L.maximumBy (comparing fst) (L.zip (L.zipWith (\f b -> f+d*b) bs fs) [1..])
upper_search :: Int -> Int -> Int -> Vector Build -> Int
upper_search lo hi elem v = let
                              mid = lo + (hi - lo) `div` 2
                              bin' | elem < daye (v!lo) = dayi (v!0)
                                   | elem == daye (v!lo) = -1
                                   | elem > daye (v!hi) = dayi (v!hi)
                                   | elem == daye (v!hi) = -1{--let
                                                              (t1,((b1,f1),idx1)) = v!hi
                                                              (t2, ((b2,f2), idx2)) = v!(hi-1) 
                                                            in
                                                              if idx1 > idx2 then idx1 else idx2--}


                                   | elem == daye (v!mid) = -1{--let
                                                                 (t1,((b1,f1),idx1)) = v!mid
                                                                 (t2, ((b2,f2), idx2)) = v!(mid-1) 
                                                            in
{-- trace (show (v!mid) L.++ "   " L.++ show (v!(mid-1)))  $ --} if idx1 > idx2 then idx1 else idx2--}   
                                   | elem > daye (v!mid) = {-- trace ("gt " L.++ show elem) $--} if elem < daye (v!(mid+1)) then dayi (v!(mid)) else upper_search (mid+1) hi elem v
                                   | elem < daye (v!mid) = {-- trace ("lt " L.++ show elem) $ --} if elem > daye (v!(mid-1)) then dayi (v!(mid-1)) else upper_search lo (mid-1) elem v
                            in
{--trace (" search " L.++ show elem) $--} bin'


main = do
  [n,q] <- fmap (L.map (read::String->Int) . words) getLine
  bs <- fmap (L.map (read::String->Int) . words) getLine
  fs <- fmap (L.map (read::String->Int) . words) getLine 
  let bd = sortBy (cmpfn) (L.zip (L.zip bs fs) [1..])
{--  putStrLn $ show bd--}
  let ti = prebuild bd
{--  putStrLn $ show $ bd
  putStrLn $ show $ ti --}
{--let ts = tstolist (ti)--}
  let tv = tstovector (ti)
{--  
  putStrLn $ show $ tstolist (ti)
--}  
{--  putStrLn $ show $ tv--}
  forM_ [1..q] $ const $ do
    d <- readLn :: IO Int
{--    
    let v = case lookupLT (d,((inf,inf),inf)) ts of
              Just (_,((_,_),idx))  -> idx
              Nothing -> 0
--}              
    let v1 = upper_search 0 (V.length tv - 1) d tv
{--putStrLn $ show v1--}     
--    putStrLn $ show v L.++ "   v1:  " L.++ show v1
    if v1 /= -1 then putStrLn $ show v1 else putStrLn $ show $ snd $ tallest_build bs fs d

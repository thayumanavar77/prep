import Control.Monad (forM_, when)
import Data.Array as A
import Control.Monad.ST
import Data.List as L
import Data.Vector.Unboxed as V hiding (forM_,takeWhile)
import Data.Vector.Unboxed.Mutable as MV

viprime :: Int -> Vector Bool
viprime n = runST $ do
  pvec <- MV.new (n+1)
  set pvec True
  forM_(takeWhile (\x -> x*x <= n) [2..n]) $ \x -> do
    v <- MV.read pvec x
    when v $
      forM_ [2*x, 3*x .. n] $ \y -> MV.write pvec y False
  MV.write pvec 0 False
  MV.write pvec 1 False
  freeze pvec 

num_integral_soln n = let
                        primevec = viprime 1000001
                        isdivide p i = n `div` (p^i)
                        num_factor x = L.foldl' (+)  0 . L.takeWhile (/= 0)  $ L.map (\x' -> isdivide x x') [1..] 
                        calc_num_soln tnum index isprime = if isprime && index > 1 then (tnum * (((num_factor index)*2)+1)) `mod` 1000007 else tnum 
                      in
                        ifoldl' (calc_num_soln) 1 (V.take (n+1) primevec)  
main = do
       n <- readLn :: IO Int
       putStrLn . show $ num_integral_soln n

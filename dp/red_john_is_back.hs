import Control.Monad (forM_, when)
import Data.Array as A
import Control.Monad.ST
import Data.Vector.Unboxed as V hiding (forM_,takeWhile)
import Data.Vector.Unboxed.Mutable as MV


waysBrickArr = A.listArray (0, 41) [f i | i<-[0..]]
f n | n < 4 = 1
    | otherwise = (waysBrickArr A.! (n-1)) + (waysBrickArr A.! (n-4))
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

primevec = viprime 217287
countPrimeBricks = listArray (1,41) [countp i | i<-[1..]]
countp i =  V.foldl' (\x y -> if y then 1+x else x ) 0 (V.take ((waysBrickArr A.! i)+1) primevec)
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    c <- readLn :: IO Int
    putStrLn $ show $ countPrimeBricks A.! c

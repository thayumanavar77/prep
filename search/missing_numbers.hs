import Control.Monad
import Data.Map as M
import Data.List as L
import Debug.Trace
--diffList :: Map Integer Int -> Map Integer Int -> [Integer]
diffList xm ym = trace (show ym) $ foldrWithKey (\k v ks -> (replicate v k) ++ ks) [] cm
                 where
                  diffo v1 v2 = if (v1-v2) == 0 then Nothing else Just (v1-v2)
                  cm = differenceWith diffo ym xm
main = do
  x <- readLn :: IO Int
  xs <- fmap (L.map (read::String -> Int) . words) getLine
  y <- readLn ::IO Int
  ys <- fmap (L.map (read::String -> Int) . words) getLine
  putStrLn $ intercalate " " $ L.map show $ diffList (M.fromListWith (+) (L.map (\x->(x,1)) xs)) (M.fromListWith (+) (L.map (\x->(x,1)) ys))

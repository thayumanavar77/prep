import Control.Monad
import Data.List
import Data.Vector as V hiding (forM_,map)
data STree = Empty | Node Int Int Int (STree) (STree) deriving (Show,Eq)
buildSTree xs n = buildSTree' xs 0 n
                  where
                    buildSTree' xs' l r | l == r = let m = xs!l in (Node l r m Empty Empty)
                                        | otherwise = let
                                                         mid = (l + ((r-l) `div` 2))
                                                         left@(Node ll _ ml _ _)  = buildSTree' xs' l mid 
                                                         right@(Node _ rr mr _ _) = buildSTree' xs' (mid+1) r
                                                      in
                                                        (Node ll rr (min ml mr) left right)
                                            
rangeQuery :: Int -> Int -> STree -> Int
rangeQuery l r stree = rangeQuery' stree 
                       where  rangeQuery' Empty = maxBound :: Int
                              rangeQuery' (Node li ri m leftB rightB)
                                               | l <= li && r >= ri = m
                                               | ri < l || li > r = maxBound :: Int
                                               | otherwise = min (rangeQuery' leftB) (rangeQuery' rightB)
main = do
  [n,m] <- fmap (map (read::String -> Int) . words) getLine
  xs <- fmap (map (read::String -> Int) . words) getLine
  let stree = buildSTree (V.fromList xs) (n-1)
  let ign = rangeQuery 0 (n-1) stree
  forM_ [1..m] $ const $ do
    [l,r] <- fmap (map (read::String -> Int) . words) getLine
    putStrLn $ show $ rangeQuery l r stree

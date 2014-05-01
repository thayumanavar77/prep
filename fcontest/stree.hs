import Control.Monad
import Data.List as L
import Data.Sequence as S

data STree = Empty | Node Int Int Int (STree) (STree) deriving (Show,Eq)

buildSTree :: [Int] -> STree
buildSTree xs = buildSTree' squeue Empty
                where
                  squeue = fst (L.foldl' (\x y-> (fst x |> (Node (snd x) (snd x) y Empty Empty), snd x + 1)) (empty,0) xs)
                  buildSTree' squeue stree | S.null squeue = stree
                                           | otherwise =   let
                                                              (x' :< squeue') = viewl squeue
                                                              f squeue' | S.null squeue' = (Empty, squeue')
                                                                        | otherwise = let (y' :< squeue'') = viewl squeue' in (y',squeue'')
                                                              (y',squeue'') = f squeue'
                                                              Node lx' _ mx' _ _ = x'
                                                              snode x'' Empty = x''
                                                              snode x''@(Node lx' _ mx' _ _) y''@(Node _ ry' my' _ _) = Node lx' ry' (min mx' my') x' y'
                                                              nnode = snode x' y'
                                                            in
                                                              if y' == Empty then x' else buildSTree' (squeue'' |> nnode) nnode  

rangeQuery :: Int -> Int -> STree -> Int
rangeQuery l r stree = rangeQuery' stree 
                       where  rangeQuery' Empty = maxBound :: Int
                              rangeQuery' (Node li ri m leftB rightB)
                                               | l >= li && r <= ri = m
                                               | l < li || r > ri = maxBound :: Int
                                               | otherwise = min (rangeQuery' leftB) (rangeQuery' rightB)

main = do
  [n,m] <- fmap (map (read::String -> Int) . words) getLine
  putStrLn $ show $ n
  putStrLn $ show $ m
  xs <- fmap (map (read::String -> Int) . words) getLine
  let stree = buildSTree xs
  putStrLn $ show $ stree
  forM_ [1..m] $ const $ do
    [l,r] <- fmap (map (read::String -> Int) . words) getLine
    putStrLn $ show $ rangeQuery l r stree

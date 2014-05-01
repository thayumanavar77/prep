import Control.Monad as M
import Data.List as L
import Data.IntMap as I
import Data.Maybe
subset' [] _ _ = -1
subset' (y:ys') s msize
          | s <= 0 = msize
          | otherwise = subset' ys' (s-y) (msize+1)
findSize :: IntMap Int -> Int -> Int          
findSize im s = 
    let
      r = I.lookupGE s im
    in
      case r of 
        Just v -> snd v
        Nothing -> -1
tl :: [Int] -> [(Int, Int)]
tl xs = snd $ L.foldl' (\((s,i),l) y-> ((s+y,i+1),(s+y,i+1):l)) ((0,0),[]) $ sortBy (flip compare) xs
main = do
  n <- readLn :: IO Int
  xs <- fmap (L.map (read::String -> Int) . words) getLine
  t <- readLn :: IO Int
{--  let ys = sortBy (flip compare) xs --}
  
  let ts = tl xs
--  let ts = ylist xs

  let im = I.fromList ts
  ys <- fmap (map (read :: String->Int) . lines) getContents
  putStrLn $ show $ ys
{--
  M.forM_ [1..t] $ const $ do
    s <- readLn :: IO Int
    putStrLn $ show $ findSize im s
--}    

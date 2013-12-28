import Control.Monad
import Data.Vector hiding (forM_,map)
max_profit xv = foldr' (calc_profit) (0,0) xv
                where
                cur_max_stock_price x m = if m<=x then x else m
                calc_profit x y  = (fst y + cur_max_stock_price x (snd y) - x,cur_max_stock_price x (snd y))
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
    len <- readLn :: IO Int
    xs <- fmap (map (read :: String->Int) . words) getLine
    putStrLn $ show $ fst  (max_profit (fromList xs))

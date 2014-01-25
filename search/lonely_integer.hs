import Control.Monad
import Data.List
import Data.Bits
linteger xs = foldl' (\x y -> xor x y) 0 xs
main = do
  n <- readLn :: IO Int
  xs <- fmap (map (read::String -> Int) . words) getLine
  putStrLn $ show $ linteger xs

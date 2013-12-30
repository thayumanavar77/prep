import Control.Monad
symmetric (x,y) (x',y') = (2*x' - x, 2*y' - y)
f' (x:y:xs) = (x, y) : f' xs
f'_ = []
main = do
  num <- readLn :: IO Int
  forM_ [1..num] $ const $ do 
    xs <- fmap (f' . map (read::String->Int) . words) getLine 
    let symm = symmetric (xs!!0) (xs!!1)
    putStrLn $ show (fst symm) ++ " " ++ show (snd symm) 

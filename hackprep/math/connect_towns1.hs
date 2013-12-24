import Control.Monad
strToInt :: String -> Int
strToInt = read
strLToIntL :: [String] -> [Int]
strLToIntL xs = map (strToInt) xs
connect_towns :: [Int] -> Int
connect_towns xs = (foldr (\x y -> (x * y) `mod` 1234567) 1 xs)
main = do
  n <- readLn :: IO Int
  forM_ [1..n] $ const $ do
     n1 <- readLn :: IO Int
     inputdata <- getLine
     putStrLn $ show $ connect_towns $ strLToIntL $ words inputdata

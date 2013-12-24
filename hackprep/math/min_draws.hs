socks :: Int -> Int
socks x = x + 1
strToInt = read :: String -> Int
strLToIntL :: [String] -> [Int]
strLToIntL xs = map (strToInt) xs
main = do
  n <- readLn :: IO Int
  inputdata <- getContents
  mapM_ putStrLn $ map show $ map (socks) $ strLToIntL $ lines inputdata

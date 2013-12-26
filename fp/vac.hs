import Text.Printf (printf)

solve :: Int -> Int -> [Int] -> [Int] -> [Double]
solve l r a b = [my_area, my_volume]
                where f_at_x :: Double -> Double
                      f_at_x x = let 
                                 csum (x',y') y = (x' * (x ** y')) + y 
                                 in 
                                 foldr (csum) 0.0 $ zip (map (fromIntegral) a) (map (fromIntegral) b)
                      my_area_at_x :: Double -> Double           
                      my_area_at_x x = pi * ((f_at_x x) ** 2)
                      my_area :: Double
                      my_area = let 
                                sumsmap x' y' = ((f_at_x (x' * 0.001)) * 0.001) + y'
                                in
                                foldr (sumsmap) 0 [(1000.0 * (fromIntegral l)) .. (1000.0 * (fromIntegral r))] 
                      my_volume :: Double           
                      my_volume = let
                                  sumvmap x' y' = ((my_area_at_x (x' * 0.001)) * 0.001) + y'
                                  in
                                  foldr (sumvmap) 0 [(1000.0 *(fromIntegral l)) .. (1000.0 * (fromIntegral r))]
main :: IO ()
main = getContents >>= mapM_ (printf "%.1f\n") . (\[a, b, [l, r]] -> solve l r a b) . map (map read. words) . lines 

import Text.Printf
import Data.List (sortBy)
data Direction = CW | CCW | Colinear
            deriving (Show, Eq)
data Point = Point (Int, Int)
             deriving (Show, Eq)
                      
get_turn :: Point -> Point -> Point -> Direction                      
get_turn x y z | cprod > 0 = CCW
               | cprod < 0 = CW
               | otherwise = Colinear
               where cprod = cross_product x y z
cross_product :: Point -> Point -> Point -> Int
cross_Product (Point (x1,y1)) (Point (x2,y2)) (Point (x3,y3)) 
              = (x2 - x1)*(y3 - y1) - (y2 - y1)*(x3 - x1)
get_angle :: Point -> Point -> Double
get_angle (Point (x1,y1)) (Point (x2,y2)) = atan2 (y2-y1) (x2-x1)

compare_Y:: Point -> Point -> Ordering
compare_Y (Point (x1,y1)) (Point (x2,y2)) | y1 > y2 = GT
                                          | y1 < y2 = LT
                                          | x1 > x2 = GT
                                          | x1 < x2 = LT
compare_angle :: Point -> Point -> Point -> Ordering
compare_angle p p1 p2 | get_angle p p1 > get_angle p p2 = GT
                      | get_angle p p1 < get_angle p p2 = LE
                      | otherwise                       = EQ
sort_by_angle :: [Point] -> [Point]
sort_by_angle ps = left_point : sortBy ( compareAngles left_point) (tail (sortPs))
                 where sortPs = sortByY ps
                       left_point = head (sortPs)
hull :: [Point] -> [Point]
hull px = gscan (sort_by_angle ps)
          where gscan (x:y:z:xs) = if 

perimeter :: [Point] -> Double
perimeter = 0.0

solve :: [(Int, Int)] -> Double
solve points = perimeter $ hull points --Complete this function
     
main :: IO ()
   n <- readLn :: IO Int
   content <- getContents
   let
     points = map (\[x, y] -> (x,y)) . map (map (read::String->Int)). map words . lines $ content
     ans = solve points
   printf "%.1f\n" ans
import Data.Array

longestPalindromesQ :: Eq a => Array Int a => [Int]
longestPalindromesQ a = 
  let (afirst, alast) = bounds a
      positions = [0 .. 2*(alast-afirst+1)]
  in map (lengthPalindromeAround a) positions


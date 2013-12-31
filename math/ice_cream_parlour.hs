import Control.Monad
import Data.IntMap as I 
import Data.List as L
import Data.Maybe (fromMaybe)
index_flavour c ls = L.foldl' (calcIndex) (I.empty,(1, (0,0))) ls
                   where
                     calcIndex imap y' = let 
                                          y = c - y' 
                                          ht = fst imap
                                          index = (fst (snd imap))
                                         in 
                                          if y `I.member` ht 
                                          then 
                                            (ht, (index + 1,(fromMaybe 0 (y `I.lookup` ht), index)))
                                          else
                                            (I.insert y' index ht,((index + 1),snd (snd imap)))  
                    
                  
main = do
  t <- readLn :: IO Int
  forM_ [1..t] $ const $ do
    c <- readLn :: IO Int
    l <- readLn :: IO Int
    ls <- fmap (L.map (read :: String -> Int) . words) getLine
    let (l,r) = (snd (snd $ index_flavour c ls))
    putStrLn $ (show l) ++ " " ++ (show r)


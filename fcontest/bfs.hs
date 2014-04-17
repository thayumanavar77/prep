import Control.Monad


data Queue d = Queue [d] [d] deriving (Eq,Show,Read)

emptyQueue :: Queue d
emptyQueue = Queue [] []

isEmpty :: Queue d -> Bool
isEmpty (Queue [] []) = True
isEmpty _ = False

enqueue :: d -> Queue d -> Queue d
enqueue d (Queue xs ys) = Queue xs (d:ys)

dequeue :: Queue d -> Queue d
dequeue (Queue [] []) = error "empty queue"
dequeue (Queue [] ys) = dequeue (Queue (reverse ys) [])
dequeue (Queue (x:xs) ys) = Queue xs ys

front :: Queue d -> d
front (Queue [] []) = error "Empty Queue"
front (Queue [] ys) = last ys
front (Queue (x:xs) ys) = x

data STree a = Empty 
               | Node a (STree a) (STree a)
                 deriving (Eq, Ord, Show)

bfs_deq q = (front q, dequeue q)
--bfs :: STree a -> [a]
bfs q 
   | isEmpty q = []
   | otherwise = case bfs_deq q of 
                    ((Node d left right),q') -> d : bfs (enqueue right (enqueue left q')) 
                    (_,_) -> []

main = do
  let t = Node 1 (Node 2 Empty Empty) (Node 3 Empty Empty)
  putStrLn $ show $ bfs (enqueue t emptyQueue)
                                




data BinTree t = Empty | Root t (BinTree t) (BinTree t) deriving (Eq, Ord, Show)

hoAddnode :: Ord a => (a -> a -> Bool) -> a -> BinTree a -> BinTree a 
hoAddnode _ a Empty = Root a Empty Empty
hoAddnode a (Root b Empty Empty) = if a < b
                     then Root b (Root a Empty Empty) (Empty)
                     else Root b (Empty) (Root a Empty Empty)
hoAddnode a (Root b l r) = if a < b
                         then Root b (hoAddnode a l) r
                         else Root b l (hoAddnode a r)


hoMaketree :: Ord a => (a -> a -> Bool) -> [a] -> BinTree a

hoMaketree [] = error "Empty list"
hoMaketree [a] = hoAddnode a Empty
hoMaketree (x:xs) = hoAddnode x (hoMaketree xs)


hosort :: (a -> a -> Bool) -> [a] -> [a]
hosort _ [] = []
hosort _ [x] = [x]
hosort r (x:xs) = if r x (head xs) == True
                  then [x] ++ hosort r xs
                  else [(head xs)] ++ (hosort r (x:(tail xs)))


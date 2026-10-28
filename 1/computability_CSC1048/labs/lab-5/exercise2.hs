data BinTree t = Empty | Root t (BinTree t) (BinTree t) deriving (Eq, Ord, Show)

hoAddnode :: Ord a => (a -> a -> Bool) -> a -> BinTree a -> BinTree a 
hoAddnode _ a Empty = Root a Empty Empty
hoAddnode fn a (Root b Empty Empty) = if (fn a b)
                     then Root b (Root a Empty Empty) (Empty)
                     else Root b (Empty) (Root a Empty Empty)
hoAddnode fn a (Root b l r) = if (fn a b)
                         then Root b (hoAddnode fn a l) r
                         else Root b l (hoAddnode fn a r)


hoMaketree :: Ord a => (a -> a -> Bool) -> [a] -> BinTree a

hoMaketree _ [] = error "Empty list"
hoMaketree fn [a] = hoAddnode fn a Empty
hoMaketree fn (x:xs) = hoAddnode fn x (hoMaketree fn xs)

inorder :: Ord a => BinTree a -> [a]

inorder Empty = []
inorder (Root x Empty Empty)= [x]
inorder (Root x l r) = inorder l ++ [x] ++ inorder r 

hosort :: Ord a => (a -> a -> Bool) -> [a] -> [a]
hosort _ [] = []
hosort fn x = inorder (hoMaketree fn x)

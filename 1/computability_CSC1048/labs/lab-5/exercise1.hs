data BinTree t = Empty | Root t (BinTree t) (BinTree t) deriving (Eq, Ord, Show)

addnode :: Ord a => a -> BinTree a -> BinTree a 
addnode a Empty = Root a Empty Empty
addnode a (Root b Empty Empty) = if a < b
                     then Root b (Root a Empty Empty) (Empty)
                     else Root b (Empty) (Root a Empty Empty)
addnode a (Root b l r) = if a < b
                         then Root b (addnode a l) r
                         else Root b l (addnode a r)


maketree :: Ord a => [a] -> BinTree a

maketree [] = error "Empty list"
maketree [a] = addnode a Empty
maketree (x:xs) = addnode x (maketree xs)


inorder :: BinTree a -> [a]

inorder Empty = []
inorder (Root x Empty Empty)= [x]
inorder (Root x l r) = inorder l ++ [x] ++ inorder r 


mpsort :: Ord a => [a] -> [a]

mpsort [] = []
mpsort x = inorder (maketree x)

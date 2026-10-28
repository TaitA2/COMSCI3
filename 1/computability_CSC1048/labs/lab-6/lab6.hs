data AVL t = Empty | Root t (AVL t) (AVL t) deriving (Eq, Ord, Show)

balanceLL (Root a (Root b e d) c) = Root b e (Root a d c)
balanceRR (Root a b (Root c f d)) = Root c (Root a b f) d
balanceRL (Root a b (Root c (Root f fl e) d)) = Root f (Root a b fl) (Root c e d) 
balanceLR (Root a (Root b e (Root d f dr)) c) = Root d (Root b e f) (Root a dr c)

myMax :: Int -> Int -> Int
myMax x y = if x > y
              then x
              else y

depthAVL :: AVL t -> Int
depthAVL Empty = 0
depthAVL (Root a b c) = myMax (1 + (depthAVL b)) (1 + (depthAVL c)) 


lDepth :: AVL t -> Int
lDepth (Root n l _) = 1 + (depthAVL l)
rDepth :: AVL t -> Int
rDepth (Root n _ r) = 1 + (depthAVL r)

balanceL (Root n l r) = let avl = (Root n l r) in if lDepth l > rDepth l then balanceLL avl else balanceLR avl  
balanceR (Root n l r) = let avl = (Root n l r) in if lDepth r > rDepth r then balanceRL avl else balanceRR avl  

balanceAVL :: AVL t -> AVL t

balanceAVL Empty = Empty
balanceAVL avl = let ld = (lDepth avl) in let rd = (rDepth avl) in
                 if ld == rd then avl else
                 if ld > rd then balanceL avl
                 else balanceR avl


insertAVL :: a -> AVL a -> AVL a
insertAVL a Empty = (Root a Empty Empty)
insertAVL a (Root n Empty r) = (Root n (Root a Empty Empty) r)
insertAVL a (Root n l Empty) = (Root n l (Root a Empty Empty))
insertAVL a (Root n l r) = if (depthAVL l) < (depthAVL r)
                           then balanceAVL (Root n (insertAVL a l) r)
                           else balanceAVL (Root n l (insertAVL a r))

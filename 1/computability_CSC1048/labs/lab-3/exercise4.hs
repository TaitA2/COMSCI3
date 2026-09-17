sumPoly :: [Int] -> [Int] -> [Int]
sumPoly [] [] = []
sumPoly a [] = a
sumPoly [] b = b
sumPoly a [b] = [(head a) + b] ++ (tail a)
sumPoly [a] b = [a + (head b)] ++ (tail b)
sumPoly a b = [(head a) + (head b)] ++ sumPoly (tail a) (tail b)

evalPoly :: Int -> [Int] -> Int
evalPoly x [] = 0
evalPoly x [c] = c
evalPoly x p = ((last p) * (x ^ ((length p)-1))) + evalPoly x (init p)


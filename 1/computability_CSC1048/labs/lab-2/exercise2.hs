isSum :: Int -> Int -> Int -> Bool
isSum a b c 
            | a == b + c = True
            | b == a + c = True
            | c == a + b = True
            | otherwise  = False

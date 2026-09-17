isTriangle :: Float -> Float -> Float -> Bool
isTriangle a b c 
            | a > b + c = False
            | b > a + c = False
            | c > a + b = False
            | otherwise = True


triangleAreaCalc :: Float -> Float -> Float -> Float
triangleAreaCalc a b c =  (sqrt (s * (s - a) * (s-b) * (s - c))) where s = (a + b + c) / 2 

triangleArea :: Float -> Float -> Float -> Float
triangleArea a b c = if not (isTriangle a b c) then error "Not a triangle!" else triangleAreaCalc a b c

myUnion :: Eq a => [a] -> [a] -> [a]

myUnion a [] = a
myUnion a (bh:bt) = if elem bh a
                    then myUnion a bt
                    else myUnion (a ++ [bh]) bt


myIntersect :: Eq a => [a] -> [a] -> [a]

myIntersect _ [] = []
myIntersect [] _ = []
myIntersect (ah:at) b = if elem ah b
                        then [ah] ++ myIntersect at b
                        else myIntersect at b

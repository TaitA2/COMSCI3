myAppend :: [a] -> [a] -> [a]
myAppend a b = a++b

myHead :: [a] -> a
myHead (ah:_) = ah

myLast :: [a] -> a
myLast [a] = a
myLast (_:at) = myLast at

myTail :: [a] -> [a]
myTail (_:at) = at

myInit :: [a] -> [a]
myInit [a] = [a]
myInit (ah:at) = if length (at) == 1
                 then [ah]
                 else [ah] ++ myInit at


myLength :: [a] -> Int
myLength [a] = 1
myLength (_:at) = 1 + myLength at

myReverse :: [a] -> [a]
myReverse [a] = [a]
myReverse (ah:at) = myReverse at ++ [ah]


myConcat :: [[a]] -> [a]
myConcat [a] = a
myConcat (ah: at) = ah ++ myConcat at

mySum :: Num a => [a] -> a
mySum [a] = a
mySum (ah:at) = ah + mySum at

myProduct :: Num a => [a] -> a
myProduct [a] = a
myProduct (ah:at) = ah * myProduct at

myMaximum :: Ord a => [a] -> a
myMaximum [a] = a
myMaximum (ah:at) = if ah > head at
                    then myMaximum (ah:tail at)
                    else myMaximum at

myMinimum :: Ord a => [a] -> a
myMinimum [a] = a
myMinimum (ah:at) = if ah < head at
                    then myMinimum (ah:tail at)
                    else myMinimum at

myElem :: Eq a => a -> [a] -> Bool
myElem a [] = False
myElem a (lh:lt) = if a == lh then True else myElem a lt

myDelete :: Eq a => a -> [a] -> [a]
myDelete a [] = []
myDelete a (ah:at) = if a == ah
                     then at
                     else (ah:myDelete a at)

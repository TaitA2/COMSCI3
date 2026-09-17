isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [a] = True
isPalindrome [a, b] = a == b
isPalindrome p = if head p == last p then isPalindrome (init ( tail p)) else False

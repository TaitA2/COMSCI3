shortest :: [[a]] -> [a]
shortest [[]] = []
shortest [a] = a
shortest ls = if (length (head ls)) < (length (last ls)) then (shortest (init ls)) else (shortest (tail ls))

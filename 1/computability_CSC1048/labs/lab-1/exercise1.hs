-- CSC1048 Computability and Complexity
--
-- Adam Tait

cube :: Int -> Int
cube x = x ^ 3

edge, volume :: Int
edge = 3
volume = cube edge

surfaceArea :: Float -> Float
surfaceArea r = 4 * pi * r^2

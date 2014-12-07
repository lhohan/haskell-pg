removeOne :: Eq a => a -> [a] -> [a]
removeOne x [] = []
removeOne x (y:ys)
  | x == y      = ys
  | otherwise   = y : removeOne x ys
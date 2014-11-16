rp 0 _ = []
rp n a = a : rp (n-1) a

nth :: [a] -> Int -> a
(x : _)  nth 0  = x
(x : xs) nth n = xs nth (n-1)

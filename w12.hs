(x:xs) +++ ys = x : (xs +++ ys)
[] +++ ys = ys

dropp n(_:xs) = dropp (n-1) xs
dropp 0 xs = xs
dropp n [] = []

foldll f v (x:xs) = foldll f (f v x) xs
foldll _ v [] = v

initt(x:xs) = x : initt xs
initt[_] = []


foldrr f v (x:xs) = f x (foldrr f v xs)
foldrr _ v [] = v


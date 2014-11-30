inc []      = []
inc (n:ns)  = n+1 : inc ns

sqr []      = []
sqr (n:ns)  = n*n : sqr ns

map_ f []        = []
map_ f (x:xs)    = f(x) : map_ f xs

inc_ = map_ (+1)
sqr_ = map_ (^2)

data Expr       = Val Int | Div Expr Expr
eval(Val n)     = n
eval(Div x y)   = eval x `div` eval y


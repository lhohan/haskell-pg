inc []      = []
inc (n:ns)  = n+1 : inc ns

sqr []      = []
sqr (n:ns)  = n*n : sqr ns

map_ f []        = []
map_ f (x:xs)    = f(x) : map_ f xs

inc_ = map_ (+1)
sqr_ = map_ (^2)

data Expr = Val Int | Div Expr Expr
data Maybe_ a = Nothing_ | Just_ a deriving Show

savediv n m = if m==0 then Nothing_ else Just_(n `div` m)

eval            :: Expr -> Maybe_ Int
eval(Val n)     = Just_ n
eval(Div x y)   = case eval x of
                    Nothing_ -> Nothing_
                    Just_ n -> case eval y of
                                    Nothing_ -> Nothing_
                                    Just_ m -> savediv n m


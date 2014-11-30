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

safediv n m = if m==0 then Nothing_ else Just_(n `div` m)

apply f Nothing_ = Nothing_
apply f (Just_ x) = f x

seqn Nothing_    _       = Nothing_
seqn _          Nothing_ = Nothing_
seqn (Just_ x)    (Just_ y) = Just_(x,y)

eval            :: Expr -> Maybe_ Int
eval(Val n)     = Just_ n
eval(Div x y)   = apply f (eval x `seqn` eval y)
                    where f (n,m)= safediv n m


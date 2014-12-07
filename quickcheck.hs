allEven :: [Integer] -> Bool
allEven [] = True
allEven (x: xs) = (x `mod` 2 ==0) && allEven xs

-- QuickTest experiments

--*Main Data.Char Test.QuickCheck> quickCheck(\s -> allEven(s))
--*** Failed! Falsifiable (after 4 tests and 1 shrink):
--[1]
--*Main Data.Char Test.QuickCheck> quickCheck(\s -> allEven([2*x |x <- s]))
--+++ OK, passed 100 tests.
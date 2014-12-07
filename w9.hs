import Data.List
import Data.Char
import Unsafe.Coerce

data Nat = Zero
         | Succ Nat
         deriving Show

--natToInteger Zero       = 0
--natToInteger (Succ n)   = natToInteger n + 1

--natToInteger (Succ n)   = natToInteger n + 1
--natToInteger Zero       = 0

--natToInteger n   = natToInteger n

--natToInteger (Succ n)   = 1 + natToInteger n
--natToInteger Zero       = 0

--natToInteger = head . m
--  where m Zero     = [0]
--        m (Succ n) = [sum [x | x <- (1 : m n)]]

--natToInteger :: Nat -> Integer
--natToInteger = \ n -> genericLength[c | c <- show n, c == 'S']

natToInteger :: Nat -> Integer
natToInteger = \ n -> length[c | c <- show n, c == 'S']
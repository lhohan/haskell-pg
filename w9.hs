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

natToInteger :: Nat -> Integer
natToInteger = \ n -> genericLength[c | c <- show n, c == 'S']
--
--natToInteger :: Nat -> Integer
--natToInteger = \ n -> length[c | c <- show n, c == 'S']
--
--integerToNat 0      = Zero
--integerToNat (n+1)  = Succ (integerToNat n)
--
--integerToNat 0      = Succ Zero
--integerToNat n  = (Succ (integerToNat n))

--integerToNat n = product [(unsafeCoerce c) :: Integer | c <- show n]

--integerToNat n = integerToNat n

--integerToNat (n+1) = Succ(integerToNat n)
--integerToNat 0     = Zero

integerToNat (n+1) = let m = integerToNat n in Succ m
integerToNat 0     = Zero

--integerToNat = head . m
--  where {
--        ; m 0       = [0]
--        ; m (n+1)   = [sum [x | x <- (1 : m n)]]
--        }
--
--integerToNat :: Integer -> Nat
--integerToNat = \ n -> genericLength [c | c <- show n, isDigit c]

add :: Nat -> Nat -> Nat
--
--add Zero n      = n
--add (Succ m) n  = Succ (add n m)

--add (Succ m) n  = Succ (add n m)
--add Zero n      = n

--add Zero n      = Zero
--add (Succ m) n  = Succ (add m n)
----
--add (Succ m) n  = Succ (add m n)
--add Zero n      = Zero
--
--add n Zero      = Zero
--add n (Succ m)  = Succ (add n m)

--add n Zero      = n
--add n (Succ m)  = Succ (add m n)
--
add n (Succ m)  = Succ (add m n)
add n Zero      = n


mult :: Nat -> Nat -> Nat

mult m Zero = Zero
mult m (Succ n) = add m (mult m n)

--data Tree = Leaf Integer
--          | Node Tree Integer Tree
--
--occurs :: Integer -> Tree -> Bool
----occurs m (Leaf n) = m == n
----occurs m (Node l n r)
----  = case compare m n of
----    LT -> occurs m l
----    EQ -> True
----    GT -> occurs m r
--
----occurs m (Leaf n) = m == n
----occurs m (Node l n r)
----  = case compare m n of
----    LT -> occurs m r
----    EQ -> True
----    GT -> occurs m l
----
----occurs m (Leaf n) = compare m n
----occurs m (Node l n r)
----  = case compare m n of
----    LT -> occurs m l
----    EQ -> True
----    GT -> occurs m r
--
--occurs m (Leaf n) = m == n
--occurs m (Node l n r)
--  | m == n      = True
--  | m < n       = occurs m l
--  | otherwise   = occurs m r
--
--occurs m n = m == n
--occurs m (Node l n r)
--  | m == n      = True
--  | m < n       = occurs m l
--  | otherwise   = occurs m r

data Tree = Leaf Integer
          | Node Tree Tree

balanced :: Tree -> Bool
leaves (Leaf _) = 1
leaves (Node l r) = leaves l + leaves r
balanced (Leaf _) = True
balanced (Node l r)
  = abs (leaves l - leaves r) <= 1 && balanced l && balanced r
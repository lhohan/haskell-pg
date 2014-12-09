data Tree a = Leaf
            | Node (Tree a) a (Tree a)

repeatTree :: a -> Tree a

--repeatTree x = Node x x x

--repeatTree x = Node t x t
--    where t = repeatTree x

--repeatTree x = repeatTree (Node Leaf x Leaf)


repeatTree x = Node t x t
    where t = repeatTree (Node t x t)

putStr' [] = return ()
putStr' (x : xs) = putChar x >> putStr' xs

--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> putStrLn' ""

--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> putChar '\n'

--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >>= \x -> putChar '\n'

--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> \x -> putChar '\n'

--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> putStr' "\n"

--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> putStrLn' "\n"

--putStrLn' [] = return ""
--putStrLn' xs = putStrLn' xs >> putStr' "\n"

putStrLn' [] = putChar "\n"
putStrLn' xs = putStr' xs >> putChar '\n'


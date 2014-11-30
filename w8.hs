putStr' [] = return ()
putStr' (x : xs) = putChar x >> putStr' xs

putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >> putStrLn' ""

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

--putStrLn' [] = putChar "\n"
--putStrLn' xs = putStr' xs >> putChar '\n'

getLine_ = get []

get :: String -> IO String
get xs
  = do x <- getChar
       case x of
            '\n'    -> return xs
            _       -> get(xs ++ [x])

interact_ f
  = do input <- getLine_
       putStrLn' (f input)

sequence_' :: Monad m => [m a] -> m ()

--sequence_' [] = []
--sequence_' (m:ms) = m >> \_ -> sequence_' ms

--sequence_' [] = return ()
--sequence_' (m:ms) = (foldl (>>) m ms) >> return ()

--sequence_' ms = foldl (>>)(return ()) ms

--sequence_' [] = return ()
--sequence_' (m:ms) = m >> sequence_' ms

--sequence_' [] = return ()
--sequence_' (m:ms) = m >>= \ _ -> sequence_' ms

--sequence_' ms = foldr (>>=) (return ()) ms

sequence_' ms = foldr (>>) (return ()) ms

--sequence_' ms = foldr (>>) (return []) ms

sequence' :: Monad m => [m a] -> m [a]

--sequence'[] = return []
--sequence'(m:ms)
--    = m >>=
--        \a ->
--        do as <- sequence' ms
--           return (a:as)

--sequence' ms = foldr func (return ()) ms
--    where
--        func :: (Monad m) => m a -> m [a] -> m [a]
--        func m acc
--            = do x <- m
--                 xs <- acc
--                 return (x:xs)

--sequence' ms = foldr func (return []) ms
--    where
--        func :: (Monad m) => m a -> m [a] -> m [a]
--        func m acc = m : acc
--
--sequence' [] = return []
--sequence' (m:ms) = return (a:as)
--    where
--        a <- m
--        as <- sequence' ms
--
--sequence' ms = foldr func (return []) ms
--    where
--        func :: (Monad m) => m a -> m [a] -> m [a]
--        func m acc =
--            do x <- m
--               xs <- acc
--               return (x:xs)

--sequence' [] = return []
--sequence' (m:ms)
--    = m >>
--        \ a ->
--        do as <- sequence' ms
--           return (a:as)



--sequence' [] = return []
--sequence' (m:ms) = m >>= \a ->
--      as <- sequence' ms
--      return (a:as)

sequence' [] = return []
sequence' (m:ms)
    = do a <- m
         as <- sequence' ms
         return (a:as)

mapM' :: Monad m => (a -> m b) -> [a] -> m [b]

--mapM' f as = sequence' (map f as)

--mapM' f [] = return []
--mapM' f (a:as)
--    = f a >>= \ b -> mapM' f as >>= \ bs -> return (b:bs)

--mapM' f as = sequence_' (map f as)

--mapM' f [] = return []
--mapM' f (a:as)
--    = f a >> \ b -> mapM' f as >> \ bs -> return (b:bs)

--mapM' f [] = return []
--mapM' f (a:as)
--    do
--        f a -> b
--        mapM' f as -> bs
--        return (b:bs)mapM'

--mapM' f [] = return []
--mapM' f (a:as) =
--    do
--        b <- f a
--        bs <- mapM' f as
--        return (b:bs)
--
mapM' f [] = return []
mapM' f (a:as)
    = f a >>=
        \ b ->
        do bs <- mapM' f as
           return (b:bs)
--
--mapM' f [] = return []
--mapM' f (a:as)
--    = f a >>=
--        \ b ->
--        do bs <- mapM' f as
--           return (bs ++ [b])

filterM' :: Monad m => (a -> m Bool) -> [a] -> m [a]

filterM' _ [] = return []
filterM' p (x:xs)
    = do flag <- p x
         ys <- filterM' p xs
         if flag then return (x:ys) else return ys

foldLeftM :: Monad m => (a -> b -> m a) -> a -> [b] -> m a

foldLeftM f a [] = return a
--foldLeftM f a (x:xs) = f a x >>= \a_ -> foldLeftM f a_ xs
foldLeftM f a (x:xs) =
    do a_ <- f a x
       foldLeftM f a_ xs

--foldLeftM (\a b -> putChar b >> return (b : a ++ [b])) [] "haskell" >>= \r -> putStrLn r

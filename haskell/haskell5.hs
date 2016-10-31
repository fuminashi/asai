import Data.Char

q1 = sum [x^2|x<-[1..100]] -- 338350

-- q2
replicate n x = [x | _ <- [1..n]]
-- > replicate 0 0
-- []
-- > replicate 8 20
-- [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8]

-- q3
pyth n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x*x+y*y==z*z]
-- 重複をさけるもの
pyth' n = [(x,y,z) | x <- [1..n], y <- [x..n], z <- [y..n], x*x+y*y==z*z]
-- > pyth' 20
-- [(3,4,5),(5,12,13),(6,8,10),(8,15,17),(9,12,15),(12,16,20)]

-- q4
yakusu n = [x | x <- [1..n], n `mod` x == 0]
perfects n = [x | x <- [1..n], x+x == sum (yakusu x)]
-- > perfects 500
-- [6,28,496]

-- q5 ???????
lst1 = [(x,y) | x <- [1,2,3], y <- [4,5,6]]
lst2 = concat [[(x,y)|y <-[4,5,6]]|x<-[1,2,3]]
q5 = lst1 == lst2

-- q6
find k lst = [v | (k', v) <- lst, k == k']
positions x xs = [n | n <- (find x (zip xs [1..(length xs)]))]

-- q7
scalarproduct xs ys = sum [x*y|(x,y)<-(zip xs ys)]

-- q8
l2i c = ord c - ord 'a'      -- let2int
i2l n = chr (ord 'a' + n)  -- int2let
shift n c | isLower c = i2l ((l2i c + n) `mod` 26)
          | otherwise = c
encode n xs = [shift n x | x <- xs]

l2i' x c = ord c - ord x      -- let2int
i2l' x n = chr (ord x + n)  -- int2let
shift' n c | isLower c = i2l' 'a' ((l2i' 'a' c + n) `mod` 26)
           | isUpper c = i2l' 'A' ((l2i' 'A' c + n) `mod` 26)
           | otherwise = c
encode' n xs = [shift' n x | x <- xs]
ppap = "PenPineappleApplePen"

main = putStrLn "Hello" >> putStrLn "World"
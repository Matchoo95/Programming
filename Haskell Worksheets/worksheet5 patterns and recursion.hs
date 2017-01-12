{- Week5.hs
 This file illustrates list patterns and recursion over lists.
-}

import Prelude hiding (fst, snd, head, tail, sum, concat, reverse, zip)

-- Definitions of the prelude functions fst and snd

fst (x,_)       = x
snd (_,y)       = y

-- Definitions of the prelude functions head and tail

head (x:_)      = x
tail (_:xs)     = xs

absFirst :: [Int] -> Int
absFirst []     = -1
absFirst (x:xs) = abs x

sum :: [Int] -> Int 
sum []     = 0
sum (x:xs) =   x + sum xs

doubleAll :: [Int] -> [Int]
doubleAll []      = []
doubleAll (x:xs)  = 2*x : doubleAll xs

concat :: [[a]] -> [a]
concat []         = []
concat (x:xs)     = x ++ concat xs

reverse :: [a] -> [a]
reverse []      = []
reverse (x:xs)  = reverse xs ++ [x]

zip :: [a] -> [b] -> [(a,b)]
zip (x:xs) (y:ys)  = (x,y) : zip xs ys
zip _ _            = []

--1.
headPlusOne :: [Int] -> Int
headPlusOne [] = 0
headPlusOne (x:xs) = x + 1

--2.
duplicateHead :: [a] -> [a]
duplicateHead [] = []
duplicateHead (x:xs) = (x:(x:xs))

--3.
rotate :: [a] -> [a]
rotate (y:(x:xs)) = (x:y:xs) 
rotate xs = xs

rotate2 :: [a] -> [a]
rotate2 [a]             = [a]
rotate2 (x:y:xs)        = (y:x:xs)

--4.
listLength :: [a] -> Int
listLength [] = 0
listLength (_:xs) = 1 + listLength xs

listLength2 :: [a] -> Int
listLength2 []          = 0
listLength2 (x:xs)      = 1 + listLength2 xs

--5.
multAll :: [Int] -> Int
multAll [] = 1
multAll (x:xs) = x * multAll xs

--6.
andAll :: [Bool] -> Bool
andAll [] = True
andAll (x:xs) = x && andAll xs

--7.
countElems :: Int -> [Int] -> Int
countElems _ [] = 0
countElems n (x:xs)
    | n == x = 1 + countElems n xs
    | n /= x = countElems n xs

--8.
removeAll :: Int -> [Int] -> [Int]
removeAll _ [] = []
removeAll x (y:ys) 
    | x == y = removeAll x ys
    | otherwise = y : removeAll x ys 
    
-- not sure if right
--9.
--courseMarks name cdata = [mark | (n, mark)<-cdata, n==name]
listMarks :: String -> [StudentMark] -> [Int]
listMarks _ [] = []
listMarks name ((s,m):rest)
    | name == s = m : listMarks name rest
    | otherwise = listMarks name rest

--10.
prefix [] ys = True
prefix xs [] = False
prefix (x:xs) (y:ys) 
    | x /= y  = False
    | otherwise = prefix xs ys || prefix (x:xs) ys

--11.
subSequence :: [Int] -> [Int] -> Bool
subSequence [] _ =  True
subSequence(x:xs) (y:ys) =  prefix (x:xs) (y:ys)





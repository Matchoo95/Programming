-- Worksheet 3: Pattern Matching and Recursion

import Data.Char

import Prelude hiding ((||), (&&), gcd)

infixr 2 ||
infixr 3 &&

-- re-implementation of the or operator
(||) :: Bool -> Bool -> Bool
True || True = True
False || True = True
True || False = True
False || False = False

--(||) :: Bool -> Bool -> Bool
--False || False = False
--_ || _ = True
   
--(||) :: Bool -> Bool -> Bool
--True || _ = True
--False || a = a


--1.
(&&) :: Bool -> Bool -> Bool
(&&) True True = True  -- putting nothing is the same as using &&
(&&) True False = False
(&&) False True = False
(&&) False False = False
{-
(&&) :: Bool -> Bool -> Bool
(&&) True True = True
(&&) _ _ = False

(&&) :: Bool -> Bool -> Bool
(&&) False _ = False
(&&) _ False = False
(&&) True True = True
-}
--2.
exOr :: Bool -> Bool -> Bool
exOr True False = True
exOr False True = True
exOr _ _ = False

exOr2 :: Bool -> Bool -> Bool
True `exOr2` True   = False
False `exOr2` False = False
True `exOr2` False  = True
False `exOr2` True  = True

--3.
ifThenElse :: Bool -> Int -> Int -> Int
ifThenElse True a b = a
ifThenElse False a b = b

ifThenElse2 :: Bool -> Int -> Int -> Int
ifThenElse2 True x _ = x
ifThenElse2 False _ y = y

--4.
daysInMonth :: Int -> Int
daysInMonth 2 = 28
daysInMonth 4 = 30
daysInMonth 6 = 30
daysInMonth 9 = 30
daysInMonth 11 = 30
daysInMonth _ = 31

--5. 
sumNumbers :: Int -> Int
sumNumbers n
    | n > 0 = n + sumNumbers (n - 1)
    | n == 0 = 0
    | otherwise = error "undefined input" -- dont actually need this

--6.
sumSquares :: Int -> Int
sumSquares n
    | n > 0 = (n * n) + sumSquares (n - 1)
    | n == 0 = 0
    | otherwise = error "undefined input" -- dont actually need this
    
sumSquares2 :: Int -> Int
sumSquares2 x
    | x == 0    = 0
    | x > 0     = x^2 + sumSquares( x - 1)
    
--7.
power :: Int -> Int -> Int
power a b 
    | b == 0 = 1
    | a > 0 = a * power a (b - 1)
    | otherwise = error "undefined input" -- dont actually need this

--8
sumFromTo :: Int -> Int -> Int
sumFromTo x y
    | (x > y) = 0
    |  otherwise = x + sumFromTo (x + 1) y 

--9
gcd :: Int -> Int -> Int
gcd x y
    | y == x       = x
    | x > y        = gcd (x - y) y
    | otherwise    = gcd (y - x) x
    
gcd2 a 0 = a
gcd2 a b = gcd b y
    where y = mod a b

--10
intSquareRoot :: Int -> Int
intSquareRoot x = try x where
	try i	| i * i > x = try (i - 1)
			| i * i <= x = i

--11 -- not sure if these work
fact :: Int -> Int 
fact n 
    | n == 0    = 1
    | n > 0     = n * fact (n - 1)
    | otherwise = error "factorials not defined for negative ints"

mult :: Int -> Int -> Int
mult n m 
    | n == 0        = 0
    | n > 0         = m + mult (n - 1) m 

divide :: Int -> Int -> Int
divide n m
    | n < m         = 0
    | otherwise     = 1 + divide (n - m) m                


 



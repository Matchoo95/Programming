{- Week6.hs
 This module illustrates the use of functions as values
-}

import Data.Char

twice :: (Int -> Int) -> Int -> Int
twice f x = f (f x)

multiply :: Int -> Int -> Int
multiply x y = x * y

double = multiply 2

doubleAll = map (*2)
areDigits = map isDigit

keepPositive = filter (>0)
keepDigits = filter isDigit

addUp = foldr (+) 0 
myConcat = foldr (++) []

--1.
mult10 = map (*10)

--2.
onlyLowerCase = filter (isLower)

--3.
orAll = foldr (||) False

--4.
sumSquares = foldr (+) 0 . map (^2)






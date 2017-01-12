mult2 :: Int -> Int
mult2 x = 2 * x

mult4 :: Int -> Int
mult4 x = mult2 (mult2 x)

-- week 1--------------------------------------------------


timesTen :: Int -> Int
timesTen x = x * 10

sumThree :: Int -> Int -> Int -> Int
sumThree x y z = x + y + z

areaOfCircle :: Float -> Float
areaOfCircle x = pi * (x^2)

volumeOfCylinder :: Float -> Float -> Float
volumeOfCylinder x l = (areaOfCircle x) * l

distance :: Float -> Float -> Float -> Float -> Float
distance x1 x2 y1 y2 = sqrt((y1 - y2)^2 + (x1 - x2))

threeDifferent :: Int -> Int -> Int -> Bool
threeDifferent a b c = (a /= b) && (a /= c) && (b /= c)
threeDifferent2 :: Int -> Int -> Int -> Bool
threeDifferent2 x y z = if (x == y) || (x == z) || (y == z) then False else True 

divisibleBy :: Int -> Int -> Bool
divisibleBy a b = mod a b == 0
divisibleBy2 :: Int -> Int -> Bool
divisibleBy2 x y = if x `mod` y == 0 then True else False

isEven :: Int -> Bool
isEven x = if x `mod` 2 == 0 then True else False

-- from intergral converts to float
averageThree :: Int -> Int -> Int -> Float
averageThree x y z = fromIntegral (x + y + z) / 3

absolute :: Int -> Int
absolute x = if x < 0 then -x else x

-- week 2--------------------------------------------------

absolute2 :: Int -> Int
absolute2 x | x >= 0 = x
		   | otherwise = -x
           
sign :: Int -> Int
sign x | x >= 1 = 1
       | x <= -1 = -1
       | otherwise = 0

howManyEqual :: Int -> Int -> Int -> Int
howManyEqual a b c | a == b && a == c && c == b = 3
                   | a == b || b == c || a == c = 2
                   | otherwise = 0
                   
sumDiagonalLengths :: Float -> Float -> Float -> Float
sumDiagonalLengths a b c = a * sqrt(2) + b * sqrt(2) + c * sqrt(2)

taxiFare :: Float -> Float
taxiFare x | x <= 10 = 2.20 + (x * 0.50)
           | x > 10 = 2.20 + (10 * 0.50) + ((x - 10) * 0.30) 
-- better version
taxiFare2 :: Int -> Float
taxiFare2 x
   | x <= 10     =  fromIntegral (x) * 0.5 + 2.2
   | otherwise =  fromIntegral (x) * 0.3 + 4.2
           
howManyAboveAverage :: Int -> Int -> Int -> Int
howManyAboveAverage a b c 
    | a > average && b > average || b > average && c > average || a > average && c > average = 2
    | a > average || b > average || c > average = 1
    | otherwise = 0
    where    
    average = div (a + b + c) 3
-- smaller version with if statements
howManyAboveAverage2 :: Int -> Int -> Int -> Int
howManyAboveAverage2 x y z = larger x + larger y + larger z
    where
        average = fromIntegral (x + y + z) / 3
        larger a = if fromIntegral(a) > average then 1 else 0

validDate :: Int -> Int -> Bool
validDate dd mm 
   | dd < 1 || dd > 31 || mm < 1 || mm > 12 = False
   | mm == 2 && dd > 28  = False 
   | (mm == 4 || mm == 6 || mm == 9 || mm == 11) && dd > 30  = False 
   | otherwise           = True
    
-- daysInMonth :: Int -> Int -> Int for some reason adding this throws an error
daysInMonth mm yyyy 
   | mm == 1 || mm == 3 || mm == 5 || mm == 7 || mm == 8 || mm == 10 || mm == 12  = 31
   | yyyy `mod` 4 == 0 && mm == 2     = 29
   | yyyy `mod` 4 /= 0 && mm == 2     = 28
   | mm == 4 || mm == 6 || mm == 9 || mm == 11   = 30
    


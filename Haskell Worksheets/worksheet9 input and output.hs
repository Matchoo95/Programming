helloWorld :: IO ()
helloWorld = putStrLn "Hello, World!"

displayFile :: IO ()
displayFile = do 
    putStr "Enter the filename: "
    name <- getLine
    contents <- readFile name
    putStr contents 

getInt :: IO Int
getInt = do 
    str <- getLine
    return (read str :: Int)

isPalindrome :: String -> String
isPalindrome str
   | str == reverse str  = str ++ " is a palindrome"
   | otherwise           = str ++ " is not a palindrome"

pal :: IO ()
pal = do 
    line <- getLine
    let response = isPalindrome line
    putStrLn response

palLines :: IO ()
palLines = do 
    putStr "Enter a line: "
    str <- getLine
    if str == "" then 
        return ()
    else do 
        putStrLn (isPalindrome str)
        palLines

-- For exercise 6
fahrenheit2Celsius :: Float -> Float
fahrenheit2Celsius f = (f - 32) * 5 / 9
 
celsius2Fahrenheit :: Float -> Float
celsius2Fahrenheit c = c * 9 / 5 + 32

--1.
greeting :: IO ()
greeting = do
    putStrLn "Enter a name"
    line <- getLine
    putStrLn ("Hello, " ++ line)
    
--2.
addTwoNumbers :: IO ()
addTwoNumbers = do
    putStrLn "Enter first number"
    number1 <- getLine
    putStrLn "Enter second number"
    number2 <- getLine
    let sum = (read number1 :: Int) + (read number2 :: Int)    
    putStrLn ("The answer is: " ++ show sum)
    
--3.
copyFile :: IO ()
copyFile = do 
    putStr "Enter the filename: "
    name <- getLine
    contents <- readFile name
    putStr "Enter new filename: "
    newName <- getLine
    newFile <- writeFile newName contents
    putStr ("Done ")
    
--4. NOT YET FINISHED
buildList :: [String] -> IO ()
buildList array = do
    putStrLn "Enter a string"
    line <- getLine
    if line == "" then
        return ()
    else do
        tell (array++[line])
        
tell array = do
    putStrLn ("List is now " ++ show array)
    buildList array



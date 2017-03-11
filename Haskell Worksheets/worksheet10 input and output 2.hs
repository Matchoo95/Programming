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

--1
fruit = ["apple", "banana"]

addWord :: String -> [String] -> [String]
addWord str (x:xs)
    | str == "" = []
    | otherwise = x:xs ++ [str]
    
--2 version 1 (works but not correct answer)
wordsToString1 :: [String] -> String
wordsToString1 [] = ""
wordsToString1 x = unwords x

wordsToString2 :: [String] -> String
wordsToString2 [] = ""
wordsToString2 (x:xs) = x ++ "\n" ++ wordsToString1 xs

--2 version 2 (with recursion, this is the correct answer)
wordsToString3 :: [String] -> String
wordsToString3 [] = ""
wordsToString3 (x:xs) = x ++ "\n" ++ wordsToString3 xs

--3
wordsOfLength :: Int -> [String] -> [String]
wordsOfLength x = filter (\s -> length s == x)

--4 create UI
main :: IO ()
main = do
    contents <- readFile "words.txt"
    let listWords = read contents :: [String]
    let newList = addWord "lemon" listWords
    let listAsString = wordsToString3 newList
    print listAsString
    writeFile "words.txt" listAsString


    
--    newList <- actions listWords
--    let listAsString = show newList
--    writeFile "words.txt" listAsString



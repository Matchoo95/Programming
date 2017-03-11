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

--4
main :: IO ()
main = do
-- using readFile and read, reads the contents of words.txt (as a single string) and turns
-- this string into a list of strings (see the example use of read in the getInt function in
-- lecture FP8/9).
    contents <- readFile "words.txt"
    let listWords = read contents :: [String]
-- using addWord, adds the word “lemon” to the list
    let newList = addWord "lemon" listWords
-- using wordsToString, displays the words on the screen
    let listAsString = wordsToString3 newList
    print listAsString
-- using show and writeFile, turns the list into a single string and writes it back to
-- words.txt.
    writeFile "words.txt" (show listAsString)
    
-- 5
-- Now, modify your program so that it performs the first step (reading the list in from the
-- File) when it starts, and then provides a menu to the user with the following options:
--  add a word to the list
--  display all words
--  display all words of a given length
--  exit
-- On exiting the program, the list should be written back to the file.

main1 :: IO ()
main1 = do
    contents <- readFile "words.txt"
    let listWords = read contents :: [String]
    newList <- chooseAction listWords
    let listAsString = show newList
    writeFile "words.txt" (show listAsString)

valChoice :: IO String
valChoice = do
    putStrLn "What would you like to do? Type in the number for your option."
    putStrLn "1. Add a word to the list"
    putStrLn "2. Display all words"
    putStrLn "3. Display all words of a given length"
    putStrLn "4. Exit"
    line <- getLine
    case line of
        "1" -> return "1"
        "2" -> return "2"
        "3" -> return "3"
        "4" -> return "4"
        _ -> do putStrLn "Please input just one number"
                valChoice
        
chooseAction ::  [String] -> IO [String]
chooseAction listWords = do
    choice <- valChoice
    if choice == "1" then do
        putStrLn "Type the word you want to add: "
        word <- getLine
        let newList = addWord word listWords
        chooseAction newList
    else if choice == "2" then do
        print listWords
        chooseAction listWords
    else if choice == "3" then do
        putStrLn "Type a length: "
        length <- getInt
        print (wordsOfLength length listWords)
        chooseAction listWords
    else
        return listWords
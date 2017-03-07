--1
fruit = ["apple", "banana"]

addWord :: String -> [String] -> [String]
addWord str (x:xs)
    | str == "" = []
    | otherwise = x:xs ++ [str]
    
--2 version 1 (works but not correct answer)
listToString :: [String] -> String
listToString [] = ""
listToString x = unwords x

wordsToString :: [String] -> String
wordsToString [] = ""
wordsToString (x:xs) = x ++ "\n" ++ listToString xs

--2 version 2 (with recursion, this is the correct answer)
wordsToString2 :: [String] -> String
wordsToString2 [] = ""
wordsToString2 (x:xs) = x ++ "\n" ++ wordsToString2 xs

--3
wordsOfLength :: Int -> [String] -> [String]
wordsOfLength x = filter (\s -> length s == x)

--4 create UI





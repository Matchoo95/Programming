--1
fruit = ["apple", "banana"]

addWord :: String -> [String] -> [String]
addWord str (x:xs)
    | str == "" = []
    | otherwise = x:xs ++ [str]
    
--2
wordsToString :: [String] -> String

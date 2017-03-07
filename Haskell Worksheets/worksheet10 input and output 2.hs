--1
fruit = ["apple", "banana"]

addWord :: String -> [String] -> [String]
addWord str (x:xs)
    | str == "" = []
    | otherwise = x:xs ++ [str]
    
--2
wordsToString :: [String] -> String
wordsToString x = unwords x

--wordsToString1 :: [String] -> String
--wordsToString1 (x:xs) = toString x ++ "\n" wordsToString1 xs
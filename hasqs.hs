--Programming Assignment 2 Haskell Quicksort
-- Submitted 16 February 2024 10:30pm
-- The following code sorts an inputted list in ascending order. There are two methods to run in the csx server, one is to use the ghc compiler.
-- To do so, uncomment the main function of the program, replace the sorted list with a list of your choice and in the directory of the file, run the command ghc -o hasqs hasqs.hs . Once linked, enter ./hasqs . 
-- Otherwise if using the ghci interpreter, leave main function commented. Type ghci into csx. 
-- Then load the file by entering :load hasqs.hs 
-- Once loaded, type hasqs and your list in brackets with values separated by commas. 
-- The following code was sourced from the textbook Learn You a Haskell by Miran Lipova?ca. Variable names and comments are my own. 



hasqs :: (Ord a) => [a] -> [a]  -- Function signature: takes a list of elements of type 'a' and returns a list of elements of type 'a'
hasqs [] = []  -- Base case: an empty list is already sorted
hasqs (x:xs) =  -- Recursive case: pattern match on the list with a pivot element 'x' and the rest of the list 'xs'
    let smallerNums = hasqs [a | a <- xs, a <= x]  -- Recursively sort elements less than or equal to the pivot
        biggerNums = hasqs [a | a <- xs, a > x]     -- Recursively sort elements greater than the pivot
    in smallerNums ++ [x] ++ biggerNums          -- Concatenate the sorted sub-lists with the pivot element


--uncomment following function if using ghc compiler. 

--main :: IO () --main function to begin program if using ghc compiler
--main = do --begin main function
--    let sortedList = hasqs [4, 2, 7, 1, 3, 6, 5] -- sorted list to be sorted
--    putStrLn "Sorted List:" -- prints the words sorted list
--    print sortedList

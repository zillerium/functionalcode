import Data.List

f :: Int -> [Int] -> [Int]
f n arr =
    sortdata n arr arr
   -- putStrLn "hello"
sortdata :: Int -> [Int] -> [Int] ->[Int]
sortdata 1 a a0 = a
sortdata n a a0=
    do

    sortdata (n-1) (g a a0) (a0)

g :: [Int] -> [Int] -> [Int]
g a b =
    sort (a ++ b)

-- This part handles the Input and Output and can be used as it is. Do not modify this part.
main :: IO ()
main = getContents >>=
       mapM_ print. (\(n:arr) -> f n arr). map read. words

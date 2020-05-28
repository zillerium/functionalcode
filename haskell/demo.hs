import Data.List
import System.IO

--comments
maxInt = maxBound :: Int
minint = minBound :: Int

-- Double, Float, Integer, bigFloat

bigFloat = 3.999999999999 + 0.0000000000005

-- Bool, Char (single quotes), tuples (lists of multiple data types)

always5 :: Int
always5 = 5
always10 = 10
sumOfNums= sum[1..1000]
-- +, -, /, *
-- mod


modEx = mod 5 4
modEx2 = 7 `mod` 4

negNumEx = 5 + (-4)
num9 = 9 :: Int
num10 = 10 :: Float
sqrt9 = sqrt (fromIntegral num9)
sqrt10 = sqrt (num10)

-- pi, exp, log, ** (to the power of), truncate, round, ceiling, floor

p9 = 7 ** 5

-- sin, cos, tan, asin, atan, acos, sinh, tanh, cosh, asinh, atanh, acosh

trueAndFalse = True && False
trueOrFalse = True || False

primes = [3,5,7,11]
moreprimes = primes ++ [13,17,19]
favNums = 2 : 7 : 21 : []
-- this combines how to create a list, eg [2,7,21]
multList = [[3,5,6],[11,13,17]]

morePrimes2= 2 : moreprimes

lenprime = length moreprimes

revprime = reverse moreprimes

isListEmpty = null moreprimes


secondprime = moreprimes !! 1

prime3 = take 3 primes

is7in = 7 `elem` primes

maxPrime = maximum primes
minPrime = minimum primes

listTimes2 = [p * 2 | p <- [1..10]]
-- this sends 1..10 to p which then is piped into the set p * 2 so that the original list has its 
-- numerical values doubled

listTimes3 = [x * 3 | x <- [1..10], x*3 <= 10]
-- this tests the 1..10 against the far right condition, and the filtered result is placed into
-- the x value and then the far left part of the expression is applied

divby9N13 = [x*3 | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]
-- the , on the far right applies both filters

sortedList = sort [3,8,1,3,7]

sumOfLists = zipWith (+) [1,2,3,4] [5,6,7,9]

listGreater5 = filter (>5) moreprimes

evensUpTo20 = takeWhile (<=20) [2,4..]

multOfList = foldr (*) 1 [2,3,4,5]

pow3List = [3^n | n <- [1..10]]

multTable = [[x * y | y <- [1..10]] |x <-[1..10]]

randTuple = (1, "random")

bobSmith = ("bob", 2)

bobsName = fst bobSmith

bobsAge = snd bobSmith

names = ["bob", "john"]

addresses = ["123 main", "45 north"]

namesAll = zip names addresses
-- ghc --make demo
-- /.demo to run
whatAge :: Int -> String

whatAge 18 = "you can drive"
whatAge 21 = "you are an adult"
whatAge x = "Nothing important"

addMe :: Int -> Int -> Int

addMe x y = x + y

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x, y) (x2, y2) = (x + x2, y + y2)

factorial :: Integer -> Integer

factorial 0 = 1
factorial n = n * factorial (n-1)

prodFact n = product [1..n]

isOdd :: Int -> Bool

isOdd n
    | n `mod` 2 == 0 = False
    | otherwise = True

isEven n = n `mod` 2 == 0

whatGrade :: Int -> String

whatGrade age 
    | (age>=5) = "school age"
    | otherwise = "under school"

batAvg :: Double -> Double -> String

batAvg hits atBats
    | avg <= 0.20 = "bad"
    | avg <= 0.40 = "better"
    | otherwise =  "good"
    where avg = hits / atBats

getListItems :: [Int] -> String
getListItems (x:[]) = "lists starts with " ++ show x
getListItems (x:xs) = "first item " ++ show x ++ " and rest " ++ show xs

getFirstItem :: String -> String

getFirstItem all@(x:xs) = "first letter " ++ all ++ " rest " ++ xs

times4 :: Int -> Int
times4 x = x * 4

listTimes4 = map times4 [1,2,3]

main = do

    putStrLn "enter name "
    name <- getLine
    putStrLn ("hello " ++ name)











 

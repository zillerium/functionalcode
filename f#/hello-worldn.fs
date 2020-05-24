//Enter your code here. Read input from STDIN. Print output to STDOUT
open System
let hello n =
    for _ in 1 .. n do
    printfn("Hello World")
 
 
[<EntryPoint>]
let main argv = 
    Console.ReadLine()
    |> int
    |> hello
    0

//Enter your code here. Read input from STDIN. Print output to STDOUT
//Enter your code here. Read input from STDIN. Print output to STDOUT
open System
let hello n =
    for _ in 1 .. n do
    printfn("Hello World")
    
let list1 = [ "1";"2";"3";"4" ]
let tablesValidation (l1 : string list) (countP : int)  =
    let mutable count =  countP
    let mutable k = 0
    for i in l1 do
        let j=i |> int
        if (count = 0) then
            count <- count + 1
            k <-j
            ()
            //printfn "count: %i" k
        else
            for n in 1 .. k do
                printfn "%i" j
    //printfn "%O" l1
let rec iter items = 
  let mutable i = 0
  match items with
  | [] -> ()
  | head::tail -> 
     let i = head |> int
     printfn "%i" i
     iter tail
     
 

[<EntryPoint>]
let main argv = 
    let read _ = Console.ReadLine()
    let isValid = function null -> false | _ -> true
    let inputList = Seq.initInfinite read |> Seq.takeWhile isValid |> Seq.toList
    // list of integers
    let mutable countP = 0
    tablesValidation inputList countP
    //iter inputList
    0


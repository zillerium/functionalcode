new_printer = fn
  ("") -> IO.puts("__NOVAL__") 
  (initial_string) ->
  initial_string |>
  String.reverse |>
  IO.puts
end

new_printer2 = &(
  &1 |>
  String.revese |>
  IO.puts
)

salt = "random"

new_printer3 = &(
  &1 <> salt |>
  String.reverse |>
  IO.puts 
)

["hello", "trevor", "john"]
Enum.each ["hello", "trevor", "", "john"], new_printer
Enum.each ["hello2", "trevor2", "john2"], new_printer
Enum.each ["==hello3", "==trevor3", "==john3"], new_printer3
Enum.each ["harry", "james", "eagle"], fn(s) -> IO.puts(s) end
Enum.each ["harry1", "james1", "eagle1"], &IO.puts/1 
new_printer.("this is a test")

derfmodule Solution do

def number_question_marks(string), do: number_question_marks("", string, 1)

#helper takes previous and current string
#if nothing changes we end recursion
def number_question_marks(string, string, _), do: string

#if something changed we call recursively
def number_question_marks(_previous, string, counter) do
  new = Regex.replace(~r/\?/, string, inspect(counter), global: false)
  number_question_marks(string, new, counter + 1)
end
  #
end



defmodule Demo do

  def update do
    newmap = %{ map() | title: "other", year: 2018}
    newmap
  end

  def pattern_matching do
    #%{ title: my_title } = map()
    #my_title
    %{ title: _} = map()

  end

  def keys do
    map() |> Map.keys

  end

  def merge do
    map() |> Map.merge(%{some: "data"})

  end

  def has_key do
    map() |> Map.has_key?(:year)

  end

  def get do
    Map.get map(), :title
  end

  def map do
    %{ title: "Titanic", year: 1997}
  end
end

Demo.update |> IO.inspect
defmodule FizzBuzz do

  def work(limit \\ 100, curr \\ 1, acc \\ []) when curr <= limit do
    acc = [fizzbuzz(curr)|acc]
    work(limit, curr + 1, acc)
  end

  def work(limit, curr, acc) do
    Enum.reverse(acc) |> Enum.each(&IO.puts/1)
  end

  defp fizzbuzz(n) do
    {rem(n, 5), rem(n, 3), n} |> case do
      {0, 0, _} -> "FizzBuzz"
      {0, _, _} -> "Buzz"
      {_, 0, _} -> "Fizz"
      {_, _, n} -> n
    end
  end

end

FizzBuzz.work

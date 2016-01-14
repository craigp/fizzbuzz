defmodule FizzBuzz do

  def fizzbuzz(n) when rem(n, 15) == 0 do
    "FizzBuzz"
  end

  def fizzbuzz(n) when rem(n, 5) == 0 do
    "Buzz"
  end

  def fizzbuzz(n) when rem(n, 3) == 0 do
    "Fizz"
  end

  def fizzbuzz(n) do
    n
  end

end

1..100 |> Enum.map(&FizzBuzz.fizzbuzz/1) |> Enum.each(&IO.puts/1)

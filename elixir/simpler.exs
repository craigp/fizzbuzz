fizzbuzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Buzz"
  (_, 0, _) -> "Fizz"
  (_, _, n) -> n
end

1..100 |> Enum.map(&fizzbuzz.(rem(&1, 5), rem(&1, 3), &1)) |> Enum.join("\n") |> IO.puts


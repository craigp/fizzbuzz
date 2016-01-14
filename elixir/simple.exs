fizzbuzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Buzz"
  (_, 0, _) -> "Fizz"
  (_, _, n) -> n
end

1..100 |> Enum.map(fn(n) -> fizzbuzz.(rem(n, 5), rem(n, 3), n) end) |> Enum.each(&IO.puts/1)

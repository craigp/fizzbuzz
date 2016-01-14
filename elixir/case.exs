1..100 |> Enum.map(fn(n) ->
  {rem(n, 5), rem(n, 3), n} |> case do
    {0, 0, _} -> "FizzBuzz"
    {0, _, _} -> "Buzz"
    {_, 0, _} -> "Fizz"
    {_, _, n} -> n
  end
end) |> Enum.join("\n") |> IO.puts

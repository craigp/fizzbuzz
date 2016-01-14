fizz = Stream.cycle(["", "", "Fizz"])
buzz = Stream.cycle(["", "", "", "", "Buzz"])
Stream.zip(fizz, buzz)
  |> Enum.take(100)
  |> Enum.with_index
  |> Enum.map(fn({{fizz, buzz}, idx}) -> {fizz <> buzz, idx + 1} end)
  |> Enum.map(fn({fizzbuzz, num}) ->
    if String.length(fizzbuzz) == 0, do: num, else: fizzbuzz
  end)
  |> Enum.join("\n")
  |> IO.puts

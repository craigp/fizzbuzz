defmodule FizzBuzz do

  use GenServer

  def start_link(parent) do
    GenServer.start_link(__MODULE__, %{parent: parent}, [])
  end

  def handle_cast({:fizzbuzz, n}, %{parent: parent}) when n <= 100 do
    {rem(n, 5), rem(n, 3), n} |> case do
      {0, 0, _} -> "FizzBuzz"
      {0, _, _} -> "Buzz"
      {_, 0, _} -> "Fizz"
      {_, _, n} -> n
    end |> IO.puts
    GenServer.cast(self(), {:fizzbuzz, n + 1})
    {:noreply, %{parent: parent}}
  end

  def handle_cast({:fizzbuzz, _n}, %{parent: parent}) do
    send parent, :ok
    {:noreply, %{parent: parent}}
  end

  def handle_call({:fizzbuzz, n}, _from, state) when rem(n, 15) == 0 do
    {:reply, "FizzBuzz", state}
  end

  def handle_call({:fizzbuzz, n}, _from, state) when rem(n, 5) == 0 do
    {:reply, "Buzz", state}
  end

  def handle_call({:fizzbuzz, n}, _from, state) when rem(n, 3) == 0 do
    {:reply, "Fizz", state}
  end

  def handle_call({:fizzbuzz, n}, _from, state) do
    {:reply, n, state}
  end

  def fizzbuzz_async(pid) do
    GenServer.cast(pid, {:fizzbuzz, 1})
  end

  def fizzbuzz_sync(pid, async_fun) do
    Enum.map(1..100, fn(n) ->
      GenServer.call(pid, {:fizzbuzz, n})
    end) |> Enum.join("\n") |> IO.puts
    async_fun.(pid)
  end

end

{:ok, pid} = FizzBuzz.start_link(self())
FizzBuzz.fizzbuzz_sync(pid, &FizzBuzz.fizzbuzz_async/1)

# this is likely terrible but I don't know how else to wait for the async calls to finish
receive do
  :ok ->
    exit(:normal)
end

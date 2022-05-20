defmodule TakeANumber do
  def start() do
    spawn(__MODULE__, :counter, [0])
  end

  defp counter(number) do
    receive do
      {:take_a_number, sender} ->
        new_number = number+1
        send(sender, new_number)
        counter(new_number)
      {:report_state, sender} ->
        send(sender, number)
        counter(number)
      :stop ->
        :ok
      _ ->
        counter(number)
    end

  end
end

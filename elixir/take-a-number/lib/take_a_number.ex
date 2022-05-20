defmodule TakeANumber do
  def start() do
    spawn(&counter/0)
  end

  defp counter(number \\ 0) do
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

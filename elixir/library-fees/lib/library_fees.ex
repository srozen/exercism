defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    case datetime.hour do
      hour when hour < 12 -> true
      _ -> false
    end
  end

  def return_date(checkout_datetime) do
    days_to_return = case before_noon?(checkout_datetime) do
      true -> 28
      false -> 29
    end

    checkout_datetime
    |> naive_datetime_to_date()
    |> Date.add(days_to_return)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    difference = actual_return_datetime
    |> naive_datetime_to_date()
    |> Date.diff(planned_return_date)

    case difference do
      difference when difference < 0 -> 0
      _ -> difference
    end
  end

  def monday?(datetime) do
    # Please implement the monday?/1 function
    :ok
  end

  def calculate_late_fee(checkout, return, rate) do
    # Please implement the calculate_late_fee/3 function
    :ok
  end

  defp naive_datetime_to_date(%NaiveDateTime{year: year, month: month, day: day} = naive_datetime) do
    Date.new!(year, month, day)
  end
end

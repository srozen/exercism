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
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    expected_return_date = checkout |> datetime_from_string() |> return_date()
    return_date = datetime_from_string(return)

    compute_late_fee(expected_return_date, return_date, rate)
    |> apply_monday_reduction(return_date)
  end

  defp naive_datetime_to_date(%NaiveDateTime{year: year, month: month, day: day} = naive_datetime) do
    Date.new!(year, month, day)
  end

  defp compute_late_fee(checkout, return, rate) do
    days_late(checkout, return) * rate
  end

  defp apply_monday_reduction(fee, return) do
    case monday?(return) do
      true -> trunc(fee * 0.5)
      false -> fee
    end
  end
end

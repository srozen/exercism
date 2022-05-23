defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color, opts \\ []) do
    year_opt = Keyword.get(opts, :year, false)
    country_opt = Keyword.get(opts, :country, false)

    cellar
    |> Keyword.get_values(color)
    |> year_filter(year_opt)
    |> country_filter(country_opt)
  end

  defp year_filter(wines, year) do
    case year do
      false -> wines
      _ -> filter_by_year(wines, year)
    end
  end

  defp country_filter(wines, country) do
    case country do
      false -> wines
      _ -> filter_by_country(wines, country)
    end
  end

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end

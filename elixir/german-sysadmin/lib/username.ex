defmodule Username do
  def sanitize(username) do
    username
    |> Enum.flat_map(&sanitize_char/1)
  end

  defp sanitize_char(char) do
    case char do
      ?_ -> '_'
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      char when ?a <= char and char <= ?z -> [char]
      _ -> []
    end
  end
end

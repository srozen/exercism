defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name)
    |> String.first()
  end

  def initial(name) do
    letter =
      String.capitalize(name)
      |> first_letter()
    letter <> "."
  end

  def initials(full_name) do
    String.split(full_name)
    |> Enum.map(&initial/1)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{love_calculus(full_name1, full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end

  defp love_calculus(full_name1, full_name2) do
    initials(full_name1) <> "  +  " <> initials(full_name2)
  end
end

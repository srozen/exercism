defmodule NameBadge do
  def print(id, name, department) do
    dep = if department do
      department
    else
      "OWNER"
    end

    case id do
      nil -> "#{name} - #{String.upcase(dep)}"
      _ -> "[#{id}] - #{name} - #{String.upcase(dep)}"
    end

  end
end

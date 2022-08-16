defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    {(a1 * b2 + a2 * b1), (b1 * b2)}
    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    {(a1 * b2 - a2 * b1), (b1 * b2)}
    |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    {a1 * a2, b1 * b2}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    {a1 * b2, a2 * b1}
    |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    {Kernel.abs(a), Kernel.abs(b)}
    |> reduce_to_lowest_terms()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(_a, 0), do: {1, 1}

  def pow_rational({a, b}, n) when n > 0 do
    {a ** n, b ** n}
    |> reduce()
  end

  def pow_rational({a, b}, n) when n < 0 do
    m = Kernel.abs(n)
    {b ** m, a ** m}
    |> reduce()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    nth_root(x**a, b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    a
    |> reduce_to_lowest_terms()
    |> negative_normalization()
  end

  defp nth_root(x, n) do
    x ** (1/n)
  end

  @spec negative_normalization(a :: rational) :: rational
  defp negative_normalization({a, b}) when a < 0 and b < 0, do: {a, b}
  defp negative_normalization({a, b}) when b < 0, do: {-a, -b}
  defp negative_normalization(a), do: a

  defp reduce_to_lowest_terms({a,b}) when a == b, do: {1,1}
  defp reduce_to_lowest_terms({0,_b}) , do: {0,1}
  defp reduce_to_lowest_terms({a,b}) do
    divisor = gcd(a,b)
    {div(a, divisor), div(b, divisor)}
  end

  defp gcd(x, 0), do: x
  defp gcd(x, y) , do: gcd(y, rem(x,y))
end

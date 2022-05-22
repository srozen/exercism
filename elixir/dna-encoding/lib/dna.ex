defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna) do
    dna
    |> reverse_list()
    |> encode(<<>>)
  end

  defp encode([head | tail], sequence) do
    nucleotide = encode_nucleotide(head)
    encode(tail, <<nucleotide::4, sequence::bitstring>>)
  end

  defp encode([], sequence), do: sequence

  def decode(dna) do
    dna
    |> decode([])
    |> reverse_list()
  end

  defp decode(<<head::4, tail::binary>>, sequence) do
    decode(tail, [decode_nucleotide(head) | sequence])
  end

  defp decode(<<head, tail::binary>>, sequence) do
    <<h::4, t::4>> = <<head>>
    decode(tail, [decode_nucleotide(t) | [decode_nucleotide(h) | sequence]])
  end

  defp decode(<<>>, sequence), do: sequence

  defp reverse_list(list, acc \\ [])
  defp reverse_list([head | tail], acc), do: reverse_list(tail, [head | acc])
  defp reverse_list([], acc), do: acc
end

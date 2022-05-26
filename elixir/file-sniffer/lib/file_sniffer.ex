defmodule FileSniffer do
  def type_from_extension(extension) do
    case extension do
      "exe" -> "application/octet-stream"
      "bmp" -> "image/bmp"
      "png" -> "image/png"
      "jpg" -> "image/jpg"
      "gif" -> "image/gif"
    end
  end

  def type_from_binary(<<0x7f, 0x45, 0x4c, 0x46, _rest::binary>>), do: "application/octet-stream"
  def type_from_binary(<<0x42, 0x4D, _rest::binary>>), do: "image/bmp"
  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _rest::binary>>), do: "image/png"
  def type_from_binary(<<0xFF, 0xD8, 0xFF, _rest::binary>>), do: "image/jpg"
  def type_from_binary(<<0x47, 0x49, 0x46, _rest::binary>>), do: "image/gif"
  def type_from_binary(_), do: :error

  def verify(file_binary, extension) do
    type_to_verify = type_from_extension(extension)
    case type_from_binary(file_binary) do
      type when type == type_to_verify ->
        {:ok, type_to_verify}
      _ ->
        {:error, "Warning, file format and file extension do not match."}
    end
  end
end

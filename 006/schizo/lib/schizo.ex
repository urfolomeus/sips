defmodule Schizo do
  @moduledoc """
    Uppercase or unvowel a given string.
  """

  @doc """
    Uppercases every other word a given string. Example:

    iex> Schizo.uppercase("you are silly")
    "you ARE silly"
  """
  def uppercase(string) do
    transform_text(string, &uppercaser/1)
  end

  @doc """
    Unvowels every other word a given string.  Example:

    iex> Schizo.unvowel("you are silly")
    "you r silly"
  """
  def unvowel(string) do
    transform_text(string, &unvoweller/1)
  end

  defp transform_text(string, transformer) do
    string
      |> String.split
      |> Stream.with_index
      |> Enum.map(transformer)
      |> Enum.join(" ")
  end

  defp uppercaser(input) do
    transform_every_other_word(input, &String.upcase/1)
  end

  defp unvoweller(input) do
    transformer = fn (word) -> Regex.replace(~r/[aeiou]/, word, "") end
    transform_every_other_word(input, transformer)
  end

  defp transform_every_other_word({word, index}, transformer) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> transformer.(word)
    end
  end
end

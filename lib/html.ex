import Kernel, except: [ to_string: 1 ]

defmodule HTML do
  @moduledoc """
  Helper module to write HTML.
  """

  defstruct name: "div", attributes: [], contents: []

  def unquote(:"$handle_undefined_function")(func, []), do:       tag(func, [])
  def unquote(:"$handle_undefined_function")(func, [ args ]), do: tag(func, args)

  def tag(name, args)  do
    if Keyword.keyword?(args), do: tag(name, args, :empty),
                             else: tag(name, [], args)
  end

  def tag(name, attrs, contents) do
    %HTML{
      name: Kernel.to_string(name),
      attributes: attrs,
      contents: contents
    }
  end

  def escape(str) when is_bitstring(str) do
    str
    |> String.replace("&", "&amp;")
    |> String.replace("\"", "&quot;")
    |> String.replace("'", "&#39;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
  end
end

defimpl String.Chars, for: HTML do
  def to_string(%HTML{ name: name, attributes: attrs, contents: :empty }) do
    attrs = attrs_to_string(attrs)
    "<#{name}#{attrs} />"
  end

  def to_string(%HTML{ name: name, attributes: attrs, contents: contents }) do
    attrs = attrs_to_string(attrs)
    contents = recursive_to_string(contents)
    "<#{name}#{attrs}>#{contents}</#{name}>\n"
  end

  defp attrs_to_string(attrs) do
    Enum.map_join(attrs, "", fn { name, value } -> " #{Kernel.to_string(name)}=\"#{HTML.escape(value)}\"" end)
  end

  defp recursive_to_string(contents) when is_list(contents), do: Enum.map_join(contents, "", &recursive_to_string/1)
  defp recursive_to_string(contents),                        do: Kernel.to_string(contents)
end

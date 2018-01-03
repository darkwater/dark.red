defmodule Generator do
  @moduledoc """
  Documentation for Generator.
  """

  import HTML

  def render_page(title, body) do
    "<!DOCTYPE html>\n" <>
      to_string(tag(:html, [ lang: "en" ], [
        tag(:head, [
          tag(:title, [ title ]),
          tag(:link, [ rel: "stylesheet", type: "text/css", href: "/static/style.css" ]),
        ]),
        tag(:body, [
          header(),
          tag(:section, [ class: "content" ], [
            tag(:div, [ class: "container" ], [
              body
            ])
          ]),
          tag(:script, [ type: "text/javascript" ], ~s[
            // Having all images on 2x resolution makes them look nicer on hidpi screens.
            // I wanted to have no Javascript here at all but this is the nicest solution
            // since Firefox doesn't support the (unofficial) zoom CSS property.
            document.querySelectorAll(".content img").forEach(img => {
              img.width = img.naturalWidth / 2;
            });
          ])
        ])
      ]))
  end

  def header do
    tag(:header, [
      tag(:div, [ class: "container" ], [
        tag(:h1, [
          tag(:a, [ href: "/" ], [ "darkness" ])
        ]),
        tag(:nav, [
          tag(:a, [ href: "/"          ], [ "about me" ]),
          tag(:a, [ href: "/projects/" ], [ "projects" ]),
          tag(:a, [ href: "/blog/"     ], [ "blog" ]),
        ])
      ])
    ])
  end

  def index do
    { meta, body } = load_page("content/index.md")
    title = Keyword.get(meta, :title, "")
    render_page(title, body)
  end

  def load_page(path) do
    [ meta, body ] = File.read!(path)
                     |> String.split("\n\n", parts: 2)

    to_keyword = fn [ key, value ] -> { String.to_atom(key), String.trim(value) } end

    meta = meta |> String.split("\n") |> Enum.map(fn line -> line
           |> String.trim_leading("- ")
           |> String.split(": ")
           |> to_keyword.()
    end)

    body = Cmark.to_html(body)

    { meta, body }
  end
end

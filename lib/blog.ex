defmodule Blog do
  import Generator
  import HTML

  @months %{
    "Jan" =>  1,
    "Feb" =>  2,
    "Mar" =>  3,
    "Apr" =>  4,
    "May" =>  5,
    "Jun" =>  6,
    "Jul" =>  7,
    "Aug" =>  8,
    "Sep" =>  9,
    "Oct" => 10,
    "Nov" => 11,
    "Dec" => 12,
  }

  def pages(callback) do
    File.ls!("content/blog/")
    |> Enum.map(fn filename ->
      path = "content/blog/" <> filename
      slug = String.trim_trailing(filename, ".md")

      { meta, body } = load_page(path)

      title = Keyword.get(meta, :title, "")
      date  = Keyword.get(meta, :date, "")
      body  = render_page(title, [
        tag(:h2, title),
        tag(:p, [ tag(:em, "posted on " <> date) ]),
        body
      ])

      callback.(slug, body)
      %{ slug: slug, date: date, title: title }
    end)
    |> Enum.sort_by(fn post ->
      [ year, month, day ] = String.split(post.date, " ")
      [ year, @months[month], day ]
    end, &>/2)
  end

  def index(posts) do
    render_page("Darkwater / Blog", [
      tag(:h2, [ "blog posts" ]),
      tag(:ul, [ id: "blog-index" ], [
        Enum.map(posts, fn post ->
          tag(:li, [
            tag(:a, [ href: "/blog/#{post.slug}.html" ], [
              tag(:span, [ class: "blog-date" ], post.date),
              post.title
            ])
          ])
        end)
      ])
    ])
  end
end

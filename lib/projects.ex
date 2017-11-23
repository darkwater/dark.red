defmodule Projects do
  import Generator
  import HTML

  def pages(callback) do
    File.ls!("content/projects/")
    |> Enum.map(fn filename ->
      path = "content/projects/" <> filename
      slug = String.trim_trailing(filename, ".md")

      { meta, body } = load_page(path)

      title = Keyword.get(meta, :title, "")
      body  = render_page(title, [
        tag(:h2, title),
        body
      ])

      callback.(slug, body)
      %{
        slug: slug,
        title: title,
        cover: Keyword.get(meta, :cover, "")
      }
    end)
    # |> Enum.sort_by(fn post ->
    #   [ year, month, day ] = String.split(post.date, " ")
    #   [ year, @months[month], day ]
    # end, &>/2)
  end

  def index(posts) do
    render_page("Darkwater / Projects", [
      tag(:h2, "projects"),
      tag(:ul, [ id: "projects-index" ], Enum.map(posts, fn post ->
        tag(:li, [
          tag(:a, [ href: "/projects/#{post.slug}.html", style: "background-image: url('#{post.cover}');" ], [
            post.title
          ])
        ])
      end))
    ])
  end
end

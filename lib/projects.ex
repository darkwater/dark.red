defmodule Projects do
  import Generator
  import HTML

  @categories %{
    "ongoing"    => 1,
    "successful" => 2,
    "recent"     => 3,
    "ancient"    => 4
  }

  def pages(callback) do
    File.ls!("content/projects/")
    |> Enum.map(fn filename ->
      path = "content/projects/" <> filename
      slug = String.trim_trailing(filename, ".md")

      { meta, body } = load_page(path)

      title = Keyword.get(meta, :title, "")
      body  = render_page(title, [
        tag(:h2, title),
        tag(:article, [ class: "project-page" ], [
          body
        ])
      ])

      callback.(slug, body)
      %{
        slug: slug,
        title: title,
        cover: Keyword.get(meta, :cover, ""),
        category: Keyword.get(meta, :category, "")
      }
    end)
    |> Enum.sort_by(&(@categories[&1.category]), &>/2)
  end

  def index(projects) do
    render_page("Darkwater / Projects", projects
    |> Enum.group_by(&(&1.category))
    |> Enum.map(fn {category, projects} ->
      [
        tag(:h2, [ category <> " projects" ]),
        tag(:ul, [ class: "projects-index" ], [
          Enum.map(projects, fn project ->
            tag(:li, [
              tag(:a, [ href: "/projects/#{project.slug}.html", style: "background-image: url('#{project.cover}');" ], [
                project.title
              ])
            ])
          end)
        ])
      ]
    end)
    )
  end
end

case System.argv do
  [ site_root ] ->
    IO.write("writing index.html...\n")
    File.write!(site_root <> "/index.html", Generator.index)

    IO.write("writing projects...\n")
    File.mkdir_p!(site_root <> "/projects")
    pages = Projects.pages(fn slug, body -> File.write!(site_root <> "/projects/#{slug}.html", body) end)
    File.write!(site_root <> "/projects/index.html", Projects.index(pages))

    IO.write("writing blog posts...\n")
    File.mkdir_p!(site_root <> "/blog")
    pages = Blog.pages(fn slug, body -> File.write!(site_root <> "/blog/#{slug}.html", body) end)
    File.write!(site_root <> "/blog/index.html", Blog.index(pages))

    IO.write("\n")
    IO.write("current environment: #{Mix.env}\n")
    case Mix.env do
      :dev  -> IO.write("HARD LINKING static files...\n")
      :prod -> IO.write("COPYING static files...\n")
    end

    File.mkdir_p!(site_root <> "/static")
    for filename <- File.ls!("content/static/") do
      path = "content/static/" <> filename
      dest = site_root <> "/static/" <> filename
      case Mix.env do
        :dev  -> unless File.exists?(dest), do: File.ln!(path, dest)
        :prod -> File.cp!(path, dest)
      end
    end

    IO.write("\ndone!\n")

  _ -> raise "usage: mix run build.exs /path/to/site/root/public"
end

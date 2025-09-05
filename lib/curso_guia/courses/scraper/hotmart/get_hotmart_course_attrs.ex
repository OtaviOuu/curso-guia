defmodule CursoGuia.Courses.Scraper.Hotmart.GetHotmartCourseAttrs do
  def call(url) do
    {:ok, resp} = Req.get(url)
    {:ok, html_tree} = Floki.parse_document(resp.body)

    title =
      html_tree
      |> Floki.find("#title h1")
      |> Floki.text()

    desc =
      html_tree
      |> Floki.find("#description ._text-gray-600")
      |> Floki.raw_html()

    cover =
      html_tree
      |> Floki.find(".product-image")
      |> Floki.attribute("src")
      |> List.first()

    _price =
      html_tree
      |> Floki.find(".price--value")
      |> Floki.text()

    {:ok,
     %{
       "title" => title,
       "description" => desc,
       "cover" => cover,
       "href" => url
     }}
  end
end

defmodule CursoGuia.Platforms.GetAttrsFromPlatform do
  def call("https://hotmart.com/" <> _ = url) do
    {:ok, get_hotmart_course_data(url)}
  end

  def call("https://kiwify.com/" <> _) do
    {:ok,
     %{
       "title" => "Scraped Title",
       "description" => "Scraped Description",
       "cover" => "Scraped Cover",
       "price" => 100
     }}
  end

  def call(_), do: {:error, "Unsupported platform"}

  def get_hotmart_course_data(url) do
    {:ok, resp} = Req.get(url)
    {:ok, html_tree} = Floki.parse_document(resp.body)

    title =
      html_tree
      |> Floki.find("#title")
      |> Floki.text()

    desc =
      html_tree
      # desc vem em várias tags. Pra cada tag, add uma quebra de linha
      |> Floki.find("#description ._text-gray-600")
      |> Floki.text()

    cover =
      html_tree
      |> Floki.find(".product-image")
      |> Floki.attribute("src")
      |> List.first()

    _price =
      html_tree
      |> Floki.find(".price--value")
      |> Floki.text()

    %{
      "title" => title,
      "description" => desc,
      "cover" => cover,
      "href" => url
    }
  end
end

defmodule CursoGuia.Platforms.GetAttrsFromPlatform do
  def call("https://hotmart.com/" <> _resto) do
    {:ok,
     %{
       "title" => "ww",
       "description" => "Scraped Description",
       "cover" => "Scraped Cover",
       "price" => 100
     }}
  end

  def call("https://kiwify.com/" <> _resto) do
    {:ok,
     %{
       "title" => "Scraped Title",
       "description" => "Scraped Description",
       "cover" => "Scraped Cover",
       "price" => 100
     }}
  end

  def call(_), do: {:error, "Unsupported platform"}
end

defmodule CursoGuia.Courses.Scraper.CourseAttrsScraper do
  alias CursoGuia.Courses.Scraper

  def call("https://hotmart.com/" <> _ = url) do
    Scraper.Hotmart.GetHotmartCourseAttrs.call(url)
  end

  def call("https://kiwify.com/" <> _) do
  end

  def call(_), do: {:error, "Unsupported platform"}
end

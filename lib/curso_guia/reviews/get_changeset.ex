defmodule CursoGuia.Reviews.GetChangeset do
  alias CursoGuia.Reviews.Review

  def call(attr) do
    Review.changeset(attr)
  end
end

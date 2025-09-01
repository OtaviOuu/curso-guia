defmodule CursoGuia.Reviews.CreateReview do
  alias CursoGuia.Repo
  alias CursoGuia.Reviews.Review

  def call(attrs) do
    attrs
    |> Review.changeset()
    |> Repo.insert()
  end
end

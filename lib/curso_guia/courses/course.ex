defmodule CursoGuia.Courses.Course do
  use Ecto.Schema
  import Ecto.Changeset

  alias CursoGuia.Courses.Course

  schema "courses" do
    field :title, :string
    field :description, :string
    field :cover, :string
    field :price, :integer
    field :slug, :string
    belongs_to :platform, CursoGuia.Platforms.Platform
    timestamps()
  end

  def changeset(course, attrs) do
    course
    |> cast(attrs, [:title, :description, :price, :platform_id])
    |> put_change(:slug, generate_slug(attrs[:title]))
    |> validate()
  end

  @doc false
  def changeset(attrs) do
    %Course{}
    |> cast(attrs, [:title, :description, :price, :platform_id])
    |> put_change(:slug, generate_slug(attrs[:title]))
    |> validate()
  end

  defp validate(changeset) do
    changeset
    |> validate_required([:title, :description, :price, :platform_id, :slug])
    |> validate_length(:title, min: 3, max: 100)
    |> validate_length(:description, min: 3, max: 100)
    |> validate_number(:price, greater_than: 0)
  end

  defp generate_slug(title) do
    title
    |> String.downcase()
    |> String.replace(~r/[^\w]+/, "-")
    |> String.normalize(:nfd)
    |> String.trim("-")
  end
end

defmodule CursoGuia.Courses.Course do
  use Ecto.Schema
  import Ecto.Changeset

  alias CursoGuia.Courses.Course

  schema "courses" do
    field :title, :string
    field :description, :string
    field :cover, :string
    field :price, :integer, default: 0
    field :href, :string
    field :rating, :integer, default: 0
    field :views, :integer, default: 0
    belongs_to :platform, CursoGuia.Platforms.Platform
    timestamps()
  end

  def changeset(course, attrs) do
    course
    |> cast(attrs, [:title, :description, :price, :platform_id, :cover, :rating, :views, :href])
    |> validate()
  end

  @doc false
  def changeset(attrs) do
    %Course{}
    |> cast(attrs, [:title, :description, :price, :platform_id, :cover, :rating, :views, :href])
    |> validate()
  end

  defp validate(changeset) do
    changeset
    |> validate_required([:title, :description, :price, :platform_id])
    |> validate_length(:title, min: 3, max: 100)
    |> validate_length(:description, min: 3)
    |> validate_number(:price, greater_than: 0)
    |> validate_format(:cover, ~r/^https?:\/\//, message: "must start with http or https")
    |> validate_number(:rating, greater_than_or_equal_to: 0, less_than_or_equal_to: 10)
  end
end

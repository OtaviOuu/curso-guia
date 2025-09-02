defmodule CursoGuia.Platforms.Platform do
  use Ecto.Schema
  import Ecto.Changeset

  alias CursoGuia.Platforms.Platform

  schema "platforms" do
    field :name, :string
    field :logo, :string
    field :href, :string
    has_many :courses, CursoGuia.Courses.Course
    timestamps()
  end

  def changeset(attrs, platform) do
    platform
    |> cast(attrs, [:name, :logo, :href])
    |> validate_required([:name, :logo, :href])
    |> validate()
  end

  @doc false
  def changeset(attrs) do
    %Platform{}
    |> cast(attrs, [:name, :logo, :href])
    |> validate_required([:name, :logo, :href])
    |> validate()
  end

  defp validate(changeset) do
    changeset
    |> validate_length(:name, min: 3, max: 50)
    |> validate_format(:logo, ~r/^https?:\/\//, message: "must start with http or https")
    |> validate_format(:href, ~r/^https?:\/\//, message: "must start with http or https")
  end
end

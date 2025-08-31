defmodule CursoGuia.Platforms.Platform do
  use Ecto.Schema
  import Ecto.Changeset

  alias CursoGuia.Platforms.Platform

  schema "platforms" do
    field :name, :string
    field :logo, :string
    field :href, :string

    timestamps()
  end

  def changeset(attrs, platform) do
    platform
    |> cast(attrs, [:name, :logo, :href])
    |> validate_required([:name, :logo, :href])
    |> validate_length(:name, min: 3, max: 50)
  end

  @doc false
  def changeset(attrs) do
    %Platform{}
    |> cast(attrs, [:name, :logo, :href])
    |> validate_required([:name, :logo, :href])
    |> validate_length(:name, min: 3, max: 50)
  end
end

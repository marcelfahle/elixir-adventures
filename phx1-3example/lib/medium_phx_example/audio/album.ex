defmodule MediumPhxExample.Audio.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias MediumPhxExample.Audio.Album


  schema "audio_albums" do
    field :name, :string
    field :release, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(%Album{} = album, attrs) do
    album
    |> cast(attrs, [:name, :release])
    |> validate_required([:name, :release])
  end
end

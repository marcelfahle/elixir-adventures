defmodule MediumPhxExample.Audio.Song do
  use Ecto.Schema
  import Ecto.Changeset
  alias MediumPhxExample.Audio.Song


  schema "audio_songs" do
    field :duration, :integer
    field :name, :string
    field :album_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Song{} = song, attrs) do
    song
    |> cast(attrs, [:name, :duration])
    |> validate_required([:name, :duration])
  end
end

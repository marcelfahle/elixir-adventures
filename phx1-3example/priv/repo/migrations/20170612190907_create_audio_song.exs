defmodule MediumPhxExample.Repo.Migrations.CreateMediumPhxExample.Audio.Song do
  use Ecto.Migration

  def change do
    create table(:audio_songs) do
      add :name, :string
      add :duration, :integer
      add :album_id, references(:audio_albums, on_delete: :nothing)

      timestamps()
    end

    create index(:audio_songs, [:album_id])
  end
end

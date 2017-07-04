defmodule MediumPhxExample.Repo.Migrations.CreateMediumPhxExample.Audio.Album do
  use Ecto.Migration

  def change do
    create table(:audio_albums) do
      add :name, :string
      add :release, :utc_datetime

      timestamps()
    end

  end
end

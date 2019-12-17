defmodule ThreeLittlePigs.Repo.Migrations.AddMeetingsTable do
  use Ecto.Migration

  def change do
    create table(:meetings) do
      add :name, :string
      add :uuid, :binary_id

      timestamps()
    end

    create unique_index(:meetings, [:uuid])
  end
end

defmodule ThreeLittlePigs.Repo.Migrations.AddCardsTable do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :content, :string
      add :author, :string
      add :type_id, references(:types)
      add :meeting_id, references(:meetings)

      timestamps()
    end
  end
end

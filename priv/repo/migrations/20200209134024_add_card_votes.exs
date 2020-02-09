defmodule ThreeLittlePigs.Repo.Migrations.AddCardVotes do
  use Ecto.Migration

  def change do
    create table(:card_votes) do
      add :card_id, references(:cards)
      add :author, :string

      timestamps()
    end

    create unique_index(:card_votes, [:card_id, :author])
  end
end

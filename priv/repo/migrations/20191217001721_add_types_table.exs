defmodule ThreeLittlePigs.Repo.Migrations.AddTypesTable do
  use Ecto.Migration

  def change do
    create table(:types) do
      add :name, :string
      add :description, :text
      add :image_name, :string
    end
  end
end

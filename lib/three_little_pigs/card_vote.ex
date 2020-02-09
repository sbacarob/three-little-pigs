defmodule ThreeLittlePigs.CardVote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "card_votes" do
    field :author, :string

    timestamps()

    belongs_to :card, ThreeLittlePigs.Card
  end

  def changeset(card_vote, attrs) do
    card_vote
    |> cast(attrs, [:card_id, :author])
    |> validate_required([:card_id, :author])
    |> foreign_key_constraint(:card_id, name: :card_votes_card_id_fkey)
    |> unique_constraint(:author, name: :card_votes_card_id_author_index)
  end
end

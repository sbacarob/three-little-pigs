defmodule ThreeLittlePigs.Card do
  @moduledoc """
  Represents a card in the Three Little Pigs retro activity.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :content, :string
    field :author, :string

    timestamps()

    belongs_to :type, ThreeLittlePigs.Type
    belongs_to :meeting, ThreeLittlePigs.Meeting
    has_many :card_votes, ThreeLittlePigs.CardVote
  end

  def changeset(card, attrs) do
    card
    |> cast(attrs, [:content, :author, :type_id, :meeting_id])
    |> validate_required([:content, :type_id, :meeting_id])
  end
end

defmodule ThreeLittlePigs.Card do
  @moduledoc """
  Represents a card in the Three Little Pigs retro activity.
  """

  use Ecto.Schema

  schema "cards" do
    field :content, :string
    field :author, :string

    timestamps()

    belongs_to :type, ThreeLittlePigs.Type
  end
end

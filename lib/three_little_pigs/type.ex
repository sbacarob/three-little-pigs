defmodule ThreeLittlePigs.Type do
  @moduledoc """
  Represents the type of the cards.
  """

  use Ecto.Schema

  schema "types" do
    field :name, :string
    field :description, :string
    field :image_name, :string
  end
end

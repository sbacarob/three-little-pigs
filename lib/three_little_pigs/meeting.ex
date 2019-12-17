defmodule ThreeLittlePigs.Meeting do
  @moduledoc """
  A three little pigs retrospective meeting
  """

  use Ecto.Schema

  schema "meetings" do
    field :name, :string
    field :uuid, :binary_id

    timestamps()
  end
end

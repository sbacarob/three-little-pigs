defmodule ThreeLittlePigs.Meeting do
  @moduledoc """
  A three little pigs retrospective meeting
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "meetings" do
    field :name, :string
    field :uuid, :binary_id

    timestamps()
  end

  def changeset(meeting, attrs) do
    meeting
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> add_uuid()
  end

  defp add_uuid(%{valid?: true} = changeset) do
    put_change(changeset, :uuid, Ecto.UUID.generate())
  end
  defp add_uuid(changeset), do: changeset
end

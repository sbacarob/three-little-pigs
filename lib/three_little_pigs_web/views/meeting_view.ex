defmodule ThreeLittlePigsWeb.MeetingView do
  use ThreeLittlePigsWeb, :view

  alias ThreeLittlePigs.{Cards, Meetings, Types}

  @doc """
  Get all cards of a meeting, given its UUID, grouped by the type of the id.
  """
  def get_meeting_cards_by_type(uuid) do
    uuid
    |> Cards.get_cards_by_meeting()
    |> Enum.group_by(&(&1.type_id))
  end

  @doc """
  Get a meeting given its UUID.
  """
  def get_meeting(uuid) do
    Meetings.get_meeting_by_uuid(uuid)
  end

  @doc """
  Get all existing types.
  """
  def get_types(), do: Types.get_types()
end

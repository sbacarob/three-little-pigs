defmodule ThreeLittlePigs.Cards do
  @moduledoc """
  Contains an API for creating, retrieving and deleting cards
  """

  alias ThreeLittlePigs.{Card, Repo}
  import Ecto.Query, only: [from: 2]

  @doc """
  Create a card with the given attributes
  """
  def create_card(attrs) do
    %Card{}
    |> Card.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Get a card by id
  """
  def get_card(id) do
    Repo.get!(Card, id)
  end

  @doc """
  Delete a card by id
  """
  def delete_card(id) do
    id
    |> get_card()
    |> Repo.delete()
  end

  @doc """
  Edit a card with the given attributes
  """
  def update_card(id, attrs) do
    id
    |> get_card()
    |> Card.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Get all cards that belong to a meeting
  """
  def get_cards_by_meeting(meeting_uuid) do
    meeting = ThreeLittlePigs.Meetings.get_meeting_by_uuid(meeting_uuid)

    from(c in Card, where: c.meeting_id == ^meeting.id)
    |> Repo.all()
  end
end

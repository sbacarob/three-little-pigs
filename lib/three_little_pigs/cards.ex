defmodule ThreeLittlePigs.Cards do
  @moduledoc """
  Contains an API for creating, retrieving and deleting cards
  """

  @topic inspect(__MODULE__)

  alias ThreeLittlePigs.{Card, Repo}
  import Ecto.Query, only: [from: 2]

  @doc """
  Create a card with the given attributes
  """
  def create_card(attrs) do
    %Card{}
    |> Card.changeset(attrs)
    |> Repo.insert()
    |> broadcast_change([:card, :created])
  end

  @doc """
  Get a card by id
  """
  def get_card(id) do
    Repo.get!(Card, id)
    |> Repo.preload([:card_votes])
  end

  @doc """
  Delete a card by id
  """
  def delete_card(id) do
    id
    |> get_card()
    |> Repo.delete()
    |> broadcast_change([:card, :deleted])
  end

  @doc """
  Edit a card with the given attributes
  """
  def update_card(id, attrs) do
    id
    |> get_card()
    |> Card.changeset(attrs)
    |> Repo.update()
    |> broadcast_change([:card, :updated])
  end

  @doc """
  Get all cards that belong to a meeting
  """
  def get_cards_by_meeting(meeting_uuid) do
    meeting = ThreeLittlePigs.Meetings.get_meeting_by_uuid(meeting_uuid)

    from(c in Card, where: c.meeting_id == ^meeting.id, preload: [:card_votes])
    |> Repo.all()
  end

  def subscribe do
    Phoenix.PubSub.subscribe(ThreeLittlePigs.PubSub, @topic)
  end

  defp broadcast_change({:ok, result}, event) do
    Phoenix.PubSub.broadcast(ThreeLittlePigs.PubSub, @topic, {__MODULE__, event, result})

    {:ok, result}
  end
end

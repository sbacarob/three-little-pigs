defmodule ThreeLittlePigs.Cards do
  @moduledoc """
  Contains an API for creating, retrieving and deleting cards
  """

  alias ThreeLittlePigs.{Card, Repo}

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
  def get_cards_by_meeting(meeting_id) do
    Repo.get_by!(Card, meeting_id: meeting_id)
  end
end

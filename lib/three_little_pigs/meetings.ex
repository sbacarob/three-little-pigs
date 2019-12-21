defmodule ThreeLittlePigs.Meetings do
  @moduledoc """
  Contains an API for creating, updating, retrieving and deleting meetings.
  """

  alias ThreeLittlePigs.{Meeting, Repo}

  @doc """
  Create a meeting with the given attributes
  """
  def create_meeting(attrs) do
    %Meeting{}
    |> Meeting.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Get a meeting by id
  """
  def get_meeting(id) do
    Repo.get!(Meeting, id)
  end

  @doc """
  Get a meeting by its UUID
  """
  def get_meeting_by_uuid(uuid) do
    Repo.get_by!(Meeting, uuid: uuid)
  end

  @doc """
  Delete a meeting by id
  """
  def delete_meeting(id) do
    id
    |> get_meeting()
    |> Repo.delete()
  end

  @doc """
  Edit a meeting with the given attributes
  """
  def edit_meeting(id, attrs) do
    id
    |> get_meeting()
    |> Meeting.changeset(attrs)
    |> Repo.update()
  end
end

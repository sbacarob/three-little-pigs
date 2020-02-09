defmodule ThreeLittlePigs.CardVotes do
  alias ThreeLittlePigs.{CardVote, Repo}

  @topic inspect(__MODULE__)

  @doc """
  Create a vote for a card
  """
  def create_card_vote(attrs) do
    %CardVote{}
    |> CardVote.changeset(attrs)
    |> Repo.insert()
    |> broadcast_change([:card_vote, :created])
  end

  def get_card_votes_by_author(card_id, author) do
    Repo.get_by(CardVote, author: author, card_id: card_id)
  end

  @doc """
  Remove vote for a card
  """
  def delete_card_vote(vote) do
    Repo.delete(vote)
    |> broadcast_change([:card_vote, :deleted])
  end

  def subscribe do
    Phoenix.PubSub.subscribe(ThreeLittlePigs.PubSub, @topic)
  end

  defp broadcast_change({:ok, result}, event) do
    Phoenix.PubSub.broadcast(ThreeLittlePigs.PubSub, @topic, {__MODULE__, event, result})

    {:ok, result}
  end
end

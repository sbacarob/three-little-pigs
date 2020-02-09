defmodule ThreeLittlePigs.CardVotes do
  alias ThreeLittlePigs.{CardVote, Repo}

  @doc """
  Create a vote for a card
  """
  def create_card_vote(attrs) do
    %CardVote{}
    |> CardVote.changeset(attrs)
    |> Repo.insert()
  end

  def get_card_votes_by_author(card_id, author) do
    Repo.get_by(CardVote, author: author, card_id: card_id)
  end

  @doc """
  Remove vote for a card
  """
  def delete_card_vote(vote) do
    Repo.delete(vote)
  end
end

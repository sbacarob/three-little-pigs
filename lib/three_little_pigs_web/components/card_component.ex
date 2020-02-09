defmodule ThreeLittlePigsWeb.CardComponent do
  use Phoenix.LiveComponent

  alias ThreeLittlePigs.{Card, Cards, CardVotes}

  def render(assigns) do
    Phoenix.View.render(ThreeLittlePigsWeb.CardView, "show.html", assigns)
  end

  def mount(socket) do
    {
      :ok,
      assign(socket,
      editing: false
      )
    }
  end

  def update(%{card: card, id: id, user: user} = _assigns, socket) do
    {
      :ok,
      assign(socket,
      card: card,
      id: id,
      user: user,
      changeset: Card.changeset(card, %{})
      )
    }
  end

  def handle_event("toggle-edit-mode", %{"target" => "input"}, %{assigns: %{editing: true}} = socket) do
    {:noreply, socket}
  end

  def handle_event("toggle-edit-mode", _, %{assigns: %{editing: editing?}} = socket) do
    {
      :noreply,
      assign(socket,
      editing: !editing?
      )
    }
  end

  def handle_event("edit", %{"card" => card_params}, %{assigns: %{id: card_id}} = socket) do
    {:ok, updated} = Cards.update_card(card_id, card_params)

    {
      :noreply,
      assign(
        socket,
        editing: false,
        card: updated,
        changeset: Card.changeset(updated, %{})
      )
    }
  end

  def handle_event("cancel?", %{"code" => "Escape"}, %{assigns: %{card: card}} = socket) do
    {
      :noreply,
      assign(
        socket,
        editing: false,
        changeset: Card.changeset(card, %{})
      )
    }
  end

  def handle_event("cancel?", _key, socket), do: {:noreply, socket}

  def handle_event("delete-card", _, %{assigns: %{id: card_id}} = socket) do
    send self(), {"deleted-card", card_id}
    {:noreply, socket}
  end

  def handle_event("upvote", _, %{assigns: %{card: card, user: user}} = socket) do
    case CardVotes.get_card_votes_by_author(card.id, user) do
      nil ->
        CardVotes.create_card_vote(%{author: user, card_id: card.id})
      vote ->
        CardVotes.delete_card_vote(vote)
    end

    send self(), "update-order"

    {:noreply, assign(socket, card: Cards.get_card(card.id))}
  end
end

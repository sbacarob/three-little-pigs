defmodule ThreeLittlePigsWeb.CardComponent do
  use Phoenix.LiveComponent

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

  def update(%{card: card, id: id} = _assigns, socket) do
    {
      :ok,
      assign(socket,
      card: card,
      id: id,
      changeset: ThreeLittlePigs.Card.changeset(card, %{})
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
    {:ok, updated} = ThreeLittlePigs.Cards.update_card(card_id, card_params)

    {
      :noreply,
      assign(
        socket,
        editing: false,
        card: updated,
        changeset: ThreeLittlePigs.Card.changeset(updated, %{})
      )
    }
  end

  def handle_event("cancel?", %{"code" => "Escape"}, %{assigns: %{card: card}} = socket) do
    {
      :noreply,
      assign(
        socket,
        editing: false,
        changeset: ThreeLittlePigs.Card.changeset(card, %{})
      )
    }
  end

  def handle_event("cancel?", _key, socket), do: {:noreply, socket}

  def handle_event("delete-card", _, %{assigns: %{id: card_id}} = socket) do
    send self(), {"deleted-card", card_id}
    {:noreply, socket}
  end
end

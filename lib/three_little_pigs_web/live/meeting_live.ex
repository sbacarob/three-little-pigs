defmodule ThreeLittlePigsWeb.MeetingLive do
  use Phoenix.LiveView

  alias ThreeLittlePigs.{Card, Cards, Meetings}

  def render(assigns) do
    Phoenix.View.render(ThreeLittlePigsWeb.MeetingView, "show.html", assigns)
  end

  def mount(%{meeting_uuid: meeting_uuid}, socket) do
    {
      :ok,
      assign(
        socket,
        meeting_uuid: meeting_uuid,
        meeting: Meetings.get_meeting_by_uuid(meeting_uuid),
        changeset: Card.changeset(%Card{}, %{}),
        cards: get_meeting_cards_by_type(meeting_uuid),
        author: nil
      )
    }
  end

  def handle_event("save", %{"card" => card_params}, %{assigns: %{meeting_uuid: uuid}} = socket) do
    Cards.create_card(card_params)

    {:noreply, assign(socket, cards: get_meeting_cards_by_type(uuid))}
  end

  def handle_event("set-author", %{"author-name" => name}, socket) do
    {:noreply, assign(socket, author: name)}
  end

  def handle_info({"deleted-card", card_id}, %{assigns: %{meeting_uuid: uuid}} = socket) do
    Cards.delete_card(card_id)
    {:noreply, assign(socket, cards: get_meeting_cards_by_type(uuid))}
  end

  def get_meeting_cards_by_type(uuid) do
    uuid
    |> Cards.get_cards_by_meeting()
    |> Enum.group_by(&(&1.type_id))
  end
end

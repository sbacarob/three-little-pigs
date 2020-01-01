defmodule ThreeLittlePigsWeb.MeetingLive do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(ThreeLittlePigsWeb.MeetingView, "show.html", assigns)
  end

  def mount(%{meeting_uuid: meeting_uuid}, socket) do
    {:ok, assign(socket, meeting_uuid: meeting_uuid)}
  end
end

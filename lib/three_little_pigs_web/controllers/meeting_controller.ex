defmodule ThreeLittlePigsWeb.MeetingController do
  @moduledoc false

  use ThreeLittlePigsWeb, :controller
  alias ThreeLittlePigs.Meetings

  def show(conn, %{"uuid" => uuid}) do
    Meetings.get_meeting_by_uuid(uuid)

    live_render(conn, ThreeLittlePigsWeb.MeetingLive, session: %{})
  end

  def create(conn, %{"meeting" => meeting_params}) do
    case Meetings.create_meeting(meeting_params) do
      {:ok, meeting} ->
        conn
        |> put_flash(:info, "Meeting created")
        |> redirect(to: Routes.meeting_path(conn, :show, meeting.uuid))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Meeting could not be created")
        |> put_view(ThreeLittlePigsWeb.PageView)
        |> render(:index, changeset: changeset)
    end
  end

  def update(conn, %{"uuid" => uuid, "meeting" => meeting_params}) do
    case Meetings.edit_meeting(uuid, meeting_params) do
      {:ok, meeting} ->
        conn
        |> put_flash(:info, "Meeting updated")
        |> redirect(to: Routes.meeting_path(conn, :show, meeting.uuid))
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Could not update meeting")
    end
  end
end

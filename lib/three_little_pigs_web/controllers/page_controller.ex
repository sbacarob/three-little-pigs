defmodule ThreeLittlePigsWeb.PageController do
  use ThreeLittlePigsWeb, :controller
  alias ThreeLittlePigs.Meeting

  def index(conn, _params) do
    changeset = Meeting.changeset(%Meeting{}, %{})

    render(conn, "index.html", changeset: changeset)
  end
end

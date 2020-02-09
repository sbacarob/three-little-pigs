defmodule ThreeLittlePigsWeb.CardView do
  use ThreeLittlePigsWeb, :view

  def get_author_initials(author) do
    author
    |> String.split(" ")
    |> Enum.map(&(String.slice(&1, 0, 1)))
    |> Enum.join()
  end
end

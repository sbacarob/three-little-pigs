defmodule ThreeLittlePigsWeb.MeetingView do
  use ThreeLittlePigsWeb, :view

  alias ThreeLittlePigs.Types

  @doc """
  Get all existing types.
  """
  def get_types(), do: Types.get_types()
end

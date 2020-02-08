defmodule ThreeLittlePigs.Types do
  @moduledoc """
  Contains functions to retrieve types
  """

  alias ThreeLittlePigs.{Type, Repo}

  def get_types() do
    Repo.all(Type)
  end
end

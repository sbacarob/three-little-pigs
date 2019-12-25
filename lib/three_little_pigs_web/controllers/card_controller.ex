defmodule ThreeLittlePigsWeb.CardController do
  @moduledoc false

  use ThreeLittlePigsWeb, :controller
  alias ThreeLittlePigs.Cards

  def create(conn, %{"card" => card_params}) do
    case Cards.create_card(card_params) do
      {:ok, card} ->
        json(conn, card)
      {:error, changeset} ->
        json(conn, changeset)
    end
  end

  def update(conn, %{"id" => card_id, "card" => card_params}) do
    case Cards.update_card(card_id, card_params) do
      {:ok, card} ->
        json(conn, card)
      {:error, changeset} ->
        json(conn, changeset)
    end
  end

  def delete(conn, %{"id" => card_id}) do
    case Cards.delete_card(card_id) do
      {:ok, card} ->
        json(conn, card)
      {:error, error} ->
        json(conn, error)
    end
  end
end

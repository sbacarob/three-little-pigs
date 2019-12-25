defmodule ThreeLittlePigsWeb.Router do
  use ThreeLittlePigsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ThreeLittlePigsWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/meetings", MeetingController, only: [:show, :update], param: "uuid"
    post "/meetings", MeetingController, :create

    resources "/cards", CardController, only: [:create, :update, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ThreeLittlePigsWeb do
  #   pipe_through :api
  # end
end

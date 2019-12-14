defmodule ThreeLittlePigs.Repo do
  use Ecto.Repo,
    otp_app: :three_little_pigs,
    adapter: Ecto.Adapters.Postgres
end

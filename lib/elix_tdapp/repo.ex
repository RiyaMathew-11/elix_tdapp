defmodule ElixTdapp.Repo do
  use Ecto.Repo,
    otp_app: :elix_tdapp,
    adapter: Ecto.Adapters.Postgres
end

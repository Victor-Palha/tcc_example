defmodule PoliceElixir.Repo do
  use Ecto.Repo,
    otp_app: :police_elixir,
    adapter: Ecto.Adapters.Postgres
end

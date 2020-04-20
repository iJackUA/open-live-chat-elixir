defmodule Olc.Repo do
  use Ecto.Repo,
    otp_app: :olc,
    adapter: Ecto.Adapters.Postgres
end

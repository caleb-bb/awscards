defmodule Awscards.Repo do
  use Ecto.Repo,
    otp_app: :awscards,
    adapter: Ecto.Adapters.Postgres
end

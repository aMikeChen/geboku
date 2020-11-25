defmodule Geboku.Repo do
  use Ecto.Repo,
    otp_app: :geboku,
    adapter: Ecto.Adapters.Postgres
end

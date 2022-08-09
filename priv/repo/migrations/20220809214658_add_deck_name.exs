defmodule Awscards.Repo.Migrations.AddDeckName do
  use Ecto.Migration

  def change do
    alter table(:cards) do
      add :deck_name, :string
    end
  end
end

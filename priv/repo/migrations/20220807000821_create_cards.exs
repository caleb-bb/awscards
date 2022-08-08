defmodule Awscards.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :front, :string
      add :back, :string
      add :category, :string
      add :card_id, :integer

      timestamps()
    end
  end
end

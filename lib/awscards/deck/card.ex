defmodule Awscards.Deck.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :back, :string
    field :category, :string
    field :front, :string
    field :card_id, :integer
    field :deck_name, :string

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:front, :back, :category, :deck_name, :id])
    |> validate_required([:front, :back, :category, :deck_name, :id])
  end
end

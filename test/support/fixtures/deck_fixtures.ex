defmodule Awscards.DeckFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Awscards.Deck` context.
  """

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        back: "some back",
        category: "some category",
        front: "some front",
        id: 42
      })
      |> Awscards.Deck.create_card()

    card
  end
end

defmodule Awscards.DeckTest do
  use Awscards.DataCase

  alias Awscards.Deck

  describe "cards" do
    alias Awscards.Deck.Card

    import Awscards.DeckFixtures

    @invalid_attrs %{back: nil, category: nil, front: nil, id: nil}

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Deck.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Deck.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{back: "some back", category: "some category", front: "some front", id: 42}

      assert {:ok, %Card{} = card} = Deck.create_card(valid_attrs)
      assert card.back == "some back"
      assert card.category == "some category"
      assert card.front == "some front"
      assert card.id == 42
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Deck.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      update_attrs = %{back: "some updated back", category: "some updated category", front: "some updated front", id: 43}

      assert {:ok, %Card{} = card} = Deck.update_card(card, update_attrs)
      assert card.back == "some updated back"
      assert card.category == "some updated category"
      assert card.front == "some updated front"
      assert card.id == 43
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Deck.update_card(card, @invalid_attrs)
      assert card == Deck.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Deck.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Deck.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Deck.change_card(card)
    end
  end
end

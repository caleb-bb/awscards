defmodule AwscardsWeb.CardLive.QuizComponent do
  use AwscardsWeb, :live_component

  alias Awscards.Deck

  @impl true
  def update(%{card: card} = assigns, socket) do
    changeset = Deck.change_card(card)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"card" => card_params}, socket) do
    changeset =
      socket.assigns.card
      |> Deck.change_card(card_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"card" => card_params}, socket) do
    save_card(socket, socket.assigns.action, card_params)
  end

  defp save_card(socket, :edit, card_params) do
    case Deck.update_card(socket.assigns.card, card_params) do
      {:ok, _card} ->
        {:noreply,
         socket
         |> put_flash(:info, "Card updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_card(socket, :new, card_params) do
    case Deck.create_card(card_params) do
      {:ok, _card} ->
        {:noreply,
         socket
         |> put_flash(:info, "Card created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

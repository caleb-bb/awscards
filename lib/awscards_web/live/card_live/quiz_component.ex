defmodule AwscardsWeb.CardLive.QuizComponent do
  use AwscardsWeb, :live_component

  alias Awscards.Deck

  def mount(socket) do
    {:ok, socket}
  end

end

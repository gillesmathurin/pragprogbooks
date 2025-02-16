defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    guess = Enum.random(1..10)

    hint = if guess > 5 do
      "Hint: The number is greater than 5"
    else
      "Hint: The number is less than 5"
    end

    {:ok, assign(
      socket,
      score: 0,
      message: "Make a guess:",
      guess: guess,
      hint: hint
      )
    }
  end

  def render(assigns) do
    ~H"""
    <h1 class="mb-4 text-4xl font-extrabold">Your score: <%= @score %></h1>
    <h2>
      <%= @message %> - <%= @hint %>
    </h2>
    <br/>
    <h2>
      <%= for n <- 1..10 do %>
        <.link href="#" class="bg-blue-500 hover:bg-blue-100 text-white font-bold py-2 px-4 border border-blue-700 rounded m-1" phx-click="guess" phx-value-number= {n} >
          <%= n %>
        </.link>
      <% end %>
    </h2>
    <br/>
    <pre>
      <%= @current_user.email %>
      <%= @session_id %>
    </pre>
    """
  end

  def handle_event("guess", %{"number" => number}, socket) do
    if String.to_integer(number) == socket.assigns.guess do
      message = "Your guess: #{number}. Correct! Guess again."
      score = socket.assigns.score + 1
      guess = Enum.random(1..10)
      hint =
        if guess > 5 do
          "Hint: The number is greater than 5"
        else
          "Hint: The number is less than 5"
         end

      {:noreply, assign(socket, score: score, message: message, guess: guess, hint: hint)}
    else
      message = "Your guess: #{number}. Wrong. Guess again."
      score = socket.assigns.score - 1
      {:noreply, assign(socket, score: score, message: message)}
    end
  end
end

defmodule HelloSocketsWeb.AuthSocket do
  alias ElixirSense.Log
  use Phoenix.Socket
  require Logger

  channel "ping", HelloSocketsWeb.PingChannel
  channel "tracked", HelloSocketsWeb.TrackedChannel
  channel "user:*", HelloSocketsWeb.AuthChannel
  channel "recurring", HelloSocketsWeb.RecurringChannel

  @impl true
  def connect(%{"token" => token}, socket, _connect_info) do
    case verify(socket, token) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}
      {:error, err} ->
        Logger.error("#{__MODULE__}: connect error #{inspect(err)}")
        :error
    end
  end

  def connect(_, _socket, _connect_info) do
    Logger.error("#{__MODULE__}: connect error missing params")
    :error
  end

  @impl true
  def id(socket), do: "auth_socket:#{socket.assigns.user_id}"

  @one_day 86400

  defp verify(socket, token) do
    Phoenix.Token.verify(socket, "salt identifier", token, max_age: @one_day)
  end
end

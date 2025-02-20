defmodule HelloSocketsWeb.WildcardChannel do
  use Phoenix.Channel

  def join("wild:" <> numbers, _payload, socket) do
    if numbers_correct?(numbers) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in("ping", %{"ack_phrase" => ack_phrase}, socket) do
    {:reply, {:ok, %{ping: ack_phrase}}, socket}
  end

  def handle_in("ping", _payload, socket) do
    {:reply, {:ok, %{ping: "pong"}}, socket}
  end

  defp numbers_correct?(numbers) do
    numbers
    |> String.split(":")
    |> Enum.map(&safe_to_integer/1)
    |> case do
      [a, b] when is_integer(a) and is_integer(b) and b == a * 2 -> true
      _ -> false
    end
  end

  defp safe_to_integer(str) do
    case Integer.parse(str) do
      {num, ""} -> num
      _ -> :error
    end
  end
end

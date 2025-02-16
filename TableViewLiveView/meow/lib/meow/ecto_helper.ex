# asked to open this file in chapter 2
defmodule Meow.EctoHelper do
  def enum(values) do
    {:parameterized, Ecto.Enum, Ecto.Enum.init(values: values)}
  end
end

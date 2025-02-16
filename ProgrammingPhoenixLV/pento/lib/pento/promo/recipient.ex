  defmodule Pento.Promo.Recipient do
    use Ecto.Schema
    import Ecto.Changeset
    @primary_key false

    embedded_schema do
      field :first_name, :string
      field :email, :string
    end

    def changeset(%__MODULE__{} = user, attrs) do
      user
      |> cast(attrs, [:first_name, :email])
      |> validate_required([:first_name, :email])
      |> validate_format(:email, ~r/@/)
    end
  end

  # Old ways of doing it without using embedded_schema
    # defstruct [:first_name, :email]
    # @types %{first_name: :string, email: :string}

    # import Ecto.Changeset

    # def changeset(%__MODULE__{} = user, attrs) do
    #   {user, @types}
    #   |> cast(attrs, Map.keys(@types))
    #   |> validate_required([:first_name, :email])
    #   |> validate_format(:email, ~r/@/)
    # end

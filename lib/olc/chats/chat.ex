defmodule Olc.Chats.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chats" do
    field :description, :string
    field :participants, {:array, :integer}
    field :public_id, Ecto.UUID
    field :settings, :map
    field :title, :string
    field :owner_id, :id

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:public_id, :title, :description, :participants, :settings])
    |> validate_required([:public_id, :title, :description, :participants, :settings])
  end
end

defmodule Olc.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :public_id, :uuid
      add :title, :string
      add :description, :string
      add :participants, {:array, :integer}
      add :settings, :map
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:chats, [:owner_id])
  end
end

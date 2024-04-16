defmodule PoliceElixir.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :registration, :string
      add :password_hash, :string
      add :role, :string

      timestamps()
    end
    create unique_index(:users, [:registration], name: :unique_registration_index)
  end
end

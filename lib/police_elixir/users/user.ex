defmodule PoliceElixir.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields_creation [:registration, :password, :role, :name]
  @required_fields_update [:registration, :role, :name]

  schema "users" do
    field :name, :string
    field :registration, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :role, Ecto.Enum, values: [:admin, :user]

    timestamps()
  end

  # Changeset to create a new user
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_fields_creation)
    |> do_validation(@required_fields_creation)
    |> hash_password()
  end

  # Changeset to update a user
  def changeset(user, params) do
    user
    |> cast(params, @required_fields_update)
    |> do_validation(@required_fields_update)
    |> hash_password()
  end

  # Validations of changeset
  def do_validation(changeset, fields_to_validate) do
    changeset
    |> validate_required(fields_to_validate)
    |> unique_constraint(:unique_registration_index)
    |> validate_length(:password_hash, min: 8)
  end

  # Function to hash the password
  def hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password_hash: Argon2.hash_pwd_salt(password))
  end

  # If the password didn`t changed, return the changeset without hashing the password
  def hash_password(changeset) do
    changeset
  end
end

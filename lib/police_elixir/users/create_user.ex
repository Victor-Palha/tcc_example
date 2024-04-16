defmodule PoliceElixir.Users.CreateUser do
  alias PoliceElixir.Users.User
  alias PoliceElixir.Repo

  @spec execute(map) :: {:ok, User.t()} | {:error, String.t()}
  def execute(attrs) do
    attrs
    |> User.changeset()
    |> Repo.insert()
  end
end

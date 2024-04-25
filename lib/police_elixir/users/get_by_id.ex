defmodule PoliceElixir.Users.GetById do
  alias PoliceElixir.Users.User
  alias PoliceElixir.Repo

  @spec execute(Integer.t()) :: {:ok, User.t()} | {:error, String.t()}
  def execute(id) do
    User
    |> Repo.get(id)
    |> case do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end

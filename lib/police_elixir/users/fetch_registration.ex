defmodule PoliceElixir.Users.FetchRegistration do
  alias PoliceElixir.Users.User
  alias PoliceElixir.Repo

  @spec execute(String.t()) :: {:ok, User.t()} | {:error, String.t()}
  def execute(registration) do
    User
    |> Repo.get_by(registration: registration)
    |> case do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end

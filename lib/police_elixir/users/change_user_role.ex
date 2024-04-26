defmodule PoliceElixir.Users.ChangeUserRole do
  alias PoliceElixir.Repo
  alias PoliceElixir.Users.User

  @spec execute(User.t(), String.t()) :: {:ok, User.t()} | {:error, User.t()}
  def execute(user, new_role) do
    user
    |> User.changeset(%{role: new_role})
    |> Repo.update()
    |> case do
      {:ok, user} -> {:ok, user}
      {:error, changeset} -> {:error, changeset}
    end
  end
end

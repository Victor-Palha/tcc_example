defmodule PoliceElixir.Users.DeleteUser do
  alias PoliceElixir.Repo
  alias PoliceElixir.Users.User

  @spec execute(User.t()) :: {:ok, User.t()} | {:error, atom()}
  def execute(user) do
    Repo.delete(user)
  end
end

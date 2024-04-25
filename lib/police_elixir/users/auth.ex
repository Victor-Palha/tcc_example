defmodule PoliceElixir.Users.Auth do
  alias PoliceElixir.Users.FetchRegistration

  def execute(registration, password) do
    case FetchRegistration.execute(registration) do
      {:ok, user} -> Argon2.verify_pass(password, user.password_hash)
      {:error, _} -> {:error, :not_found}
    end
  end
end

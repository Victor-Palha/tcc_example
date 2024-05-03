defmodule PoliceElixirWeb.Token do
  alias PoliceElixirWeb.Endpoint
  alias Phoenix.Token

  @sign_salt "PoliceTCCExample"
  def sign(user_registration, role) do
    Token.sign(Endpoint, @sign_salt, %{sub: %{user_id: user_registration, role: role}})
  end

  def verify_token(token), do: Phoenix.Token.verify(Endpoint, @sign_salt, token)

  def verify_role(token) do
    case verify_token(token) do
      {:ok, data} -> extract_user_role(data)
      _error -> {:error, "Invalid Token"}
    end
  end

  defp extract_user_role(%{sub: %{role: role}} = token_sub) do
    if role == "admin" do
      {:ok, token_sub}
    else
      {:error, "User does not have permission to access this route"}
    end
  end
end

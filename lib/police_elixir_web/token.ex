defmodule PoliceElixirWeb.Token do
  alias PoliceElixirWeb.Endpoint
  alias Phoenix.Token

  @sign_salt "PoliceTCCExample"
  def sign(user_id) do
    Token.sign(Endpoint, @sign_salt, %{sub: user_id})
  end

  def verify_token(token), do: Phoenix.Token.verify(Endpoint, @sign_salt, token)
end

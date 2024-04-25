defmodule PoliceElixirWeb.UserJSON do
  alias PoliceElixir.Users.User
  def user_created(%{user: %User{registration: registration}}) do
    %{
      message: "Usuário criado com sucesso",
      registration: registration
    }
  end

  def auth(%{ok: token}) do
    %{
      message: "Usuário autenticado com sucesso",
      token: token
    }
  end

  def auth(%{error: error}) do
    %{
      message: "Falha na autenticação",
      error: error
    }
  end
end

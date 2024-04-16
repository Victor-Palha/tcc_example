defmodule PoliceElixirWeb.UserJSON do
  alias PoliceElixir.Users.User
  def user_created(%{user: %User{registration: registration}}) do
    %{
      message: "Usuário criado com sucesso",
      registration: registration
    }
  end
end

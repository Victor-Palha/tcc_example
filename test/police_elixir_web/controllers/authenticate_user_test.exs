defmodule PoliceElixirWeb.AuthenticateUserTest do
  use PoliceElixirWeb.ConnCase
  alias PoliceElixir.Users.CreateUser

  describe "POST /users/auth" do
    test "authenticate a user", %{conn: conn} do
      #To authenticate a user, we need to create a user first
      params = %{
        "name" => "João Victor Ferreira Palha",
        "registration" => "5965778/1",
        "password" => "12345678",
        "role" => "user"
      }

      CreateUser.execute(params)

      #Now we can authenticate the user
      login_user = %{
        "registration" => "5965778/1",
        "password" => "12345678"
      }
      %{"message" => sucess_message} = post(conn, ~p"/api/users/auth", login_user) |> json_response(200)

      assert sucess_message == "Usuário autenticado com sucesso"
    end
  end
end

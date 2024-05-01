defmodule PoliceElixirWeb.CreateUserTest do
  use PoliceElixirWeb.ConnCase

  describe "POST /users" do
    test "create a user", %{conn: conn} do
      expected_response = %{
        "message" => "Usuário criado com sucesso",
        "registration" => "5965778/1"
      }

      params = %{
        "name" => "João Victor Ferreira Palha",
        "registration" => "5965778/1",
        "password" => "12345678",
        "role" => "user"
      }

      response = post(conn, ~p"/api/users", params)
      |> json_response(201)

      assert response == expected_response
    end
  end
end

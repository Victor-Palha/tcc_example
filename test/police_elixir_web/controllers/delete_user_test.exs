defmodule PoliceElixirWeb.DeleteUserTest do
  use PoliceElixirWeb.ConnCase
  alias PoliceElixir.Users.CreateUser
  alias PoliceElixir.Users.User

  setup do
    #To delete a user, we need to create a user first
    params = %{
      "name" => "João Victor Ferreira Palha",
      "registration" => "5965778/1",
      "password" => "12345678",
      "role" => "user"
    }

    {:ok, %User{id: id, role: role}} = CreateUser.execute(params)
    token = PoliceElixirWeb.Token.sign(id, role)

    {:ok, token: token, id: id}
  end

  describe "DELETE /users/:id" do
    test "delete a user", %{conn: conn, token: token, id: id} do
      conn = put_req_header(conn, "authorization", "Bearer #{token}")
      #Now we can delete the user
      %{"message" => sucess_message} = delete(conn, ~p"/api/users/#{id}") |> json_response(200)

      assert sucess_message == "Usuário deletado com sucesso"
    end
  end
end

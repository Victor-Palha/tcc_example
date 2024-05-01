defmodule PoliceElixirWeb.ChangeUserRoleTest do
  use PoliceElixirWeb.ConnCase
  alias PoliceElixir.Users.{CreateUser, User}


  describe "PATCH /users/:id" do
    test "Change User Role", %{conn: conn} do
      #To delete a user, we need to create a user first
      params = %{
        "name" => "João Victor Ferreira Palha",
        "registration" => "5965778/1",
        "password" => "12345678",
        "role" => "user"
      }

      {:ok, %User{id: id}} = CreateUser.execute(params)

      #Now we can delete the user
      %{"message" => sucess_message} = patch(conn, ~p"/api/users/#{id}", %{"new_role" => "admin"}) |> json_response(200)

      assert sucess_message == "Usuário atualizado com sucesso"
    end
  end
end

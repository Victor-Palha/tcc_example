defmodule PoliceElixirWeb.Units.TokenTest do
  use PoliceElixirWeb.ConnCase
  alias PoliceElixirWeb.Token

  describe "Test Token generation" do
    test "Generate Token" do
      random_user_id = 10
      user_role = "user"
      token = Token.sign(random_user_id, user_role)
      assert token != nil
    end

    test "Verify Token" do
      random_user_id = 10
      user_role = "admin"
      token = Token.sign(random_user_id, user_role)
      {:ok, data} = Token.verify_token(token)
      assert data.sub == %{user_id: random_user_id, role: user_role}
    end

    test "Verify Role" do
      random_user_id = 10
      user_role = "admin"
      token = Token.sign(random_user_id, user_role)
      {:ok, %{sub: sub}} = Token.verify_role(token)

      assert sub == %{user_id: random_user_id, role: user_role}
    end
  end
end

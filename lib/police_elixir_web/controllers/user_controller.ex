defmodule PoliceElixirWeb.UserController do
  use PoliceElixirWeb, :controller
  alias PoliceElixir.Users
  alias Users.CreateUser

  def create(conn, params_req) do
    with {:ok, user} <- CreateUser.execute(params_req) do
      conn
      |> put_status(:created)
      |> render(:user_created, user: user)
    end
  end
end

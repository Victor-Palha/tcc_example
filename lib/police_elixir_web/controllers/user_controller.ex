defmodule PoliceElixirWeb.UserController do
  use PoliceElixirWeb, :controller
  alias PoliceElixirWeb.Token
  alias PoliceElixir.Users
  alias Users.CreateUser
  alias Users.FetchRegistration
  alias Users.Auth

  def create(conn, params_req) do
    with {:ok, user} <- CreateUser.execute(params_req) do
      conn
      |> put_status(:created)
      |> render(:user_created, user: user)
    end
  end

  def auth(conn, params_req) do
    %{"registration" => registration, "password" => password} = params_req

    case Auth.execute(registration, password) do
      true -> conn |> put_status(:ok) |> render(:auth, ok: generate_token(registration))
      false -> conn |> put_status(:unauthorized) |> render(:auth, error: "Invalid password or Registration")
      {:error, :not_found} -> conn |> put_status(:unauthorized) |> render(:auth, error: "Invalid password or Registration")
      {:error, _} -> conn |> put_status(:internal_server_error) |> render(:auth, error: "Internal Server Error")
    end

  end

  defp generate_token(registration) do
    with {:ok, %{id: user_id}} <- FetchRegistration.execute(registration) do
      Token.sign(user_id)
    end
  end
end

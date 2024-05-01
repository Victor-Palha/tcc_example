defmodule PoliceElixirWeb.UserController do
  use PoliceElixirWeb, :controller
  alias PoliceElixirWeb.Token
  alias PoliceElixir.Users
  alias Users.CreateUser
  alias Users.FetchRegistration
  alias Users.Auth
  alias Users.DeleteUser
  alias Users.GetById
  alias Users.ChangeUserRole

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
      false -> conn |> put_status(:unauthorized) |> render(:auth, error: "Matricula ou senha inválida")
      {:error, :not_found} -> conn |> put_status(:unauthorized) |> render(:auth, error: "Matricula ou senha inválida")
      {:error, _} -> conn |> put_status(:internal_server_error) |> render(:auth, error: "Internal Server Error")
    end

  end

  def delete(conn, params_req) do
    %{"id" => id} = params_req
    id_parsed = String.to_integer(id)

    case GetById.execute(id_parsed) do
      {:ok, user} ->
        DeleteUser.execute(user)
        conn |> put_status(:ok) |> render(:user_deleted, ok: user)
      {:error, _} -> conn |> put_status(:not_found) |> render(:user_deleted, error: :not_found)
    end
  end

  def change_role(conn, params_req) do
    %{"id" => id, "new_role" => new_role} = params_req

    case GetById.execute(id) do
      {:ok, user} ->
        ChangeUserRole.execute(user, new_role)
        conn |> put_status(:ok) |> render(:user_updated, ok: user)
      {:error, _} -> conn |> put_status(:not_found) |> render(:user_updated, error: :not_found)
    end
  end

  defp generate_token(registration) do
    with {:ok, %{id: user_id}} <- FetchRegistration.execute(registration) do
      Token.sign(user_id)
    end
  end
end

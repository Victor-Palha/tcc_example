defmodule PoliceElixirWeb.RegisterController do
  use PoliceElixirWeb, :controller

  def create(conn, params_req) do
    %{"register" => register} = params_req

    render(conn, :index, ok: register)
  end
end

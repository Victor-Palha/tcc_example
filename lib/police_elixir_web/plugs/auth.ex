defmodule PoliceElixirWeb.Plugs.Auth do
    import Plug.Conn
    alias PoliceElixirWeb.Token

    def init(opts), do: opts

    def call(conn, _opts) do
        with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
          {:ok, data} <- Token.verify_token(token) do
            assign(conn, :user_sub, data.sub)
          else
            _error ->
              conn
              |> put_status(401)
              |> Phoenix.Controller.put_view(PoliceElixirWeb.ErrorJSON)
              |> Phoenix.Controller.render(:error, status: 401)
              |> halt()
          end
    end
end

defmodule PoliceElixirWeb.RegisterJSON do
  def index(%{ok: register}) do
    %{
      message: register
    }
  end
end

defmodule PoliceElixir.Registers.CreateRegister do
  alias PoliceElixir.Registers.Register
  alias PoliceElixir.Repo

  @spec execute(Register.t()) :: {:ok, Register.t()} | {:error, String.t()}
  def execute(register) do
    register
    |> Register.changeset()
    |> Repo.insert()
  end
end

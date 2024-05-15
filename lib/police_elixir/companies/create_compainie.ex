defmodule PoliceElixir.Companies.CreateCompainie do
  alias PoliceElixir.Companies.Compainie
  alias PoliceElixir.Repo

  @spec execute(Compainie.t()) :: {:ok, Compainie.t()} | {:error, String.t()}
  def execute(compaine) do
    compaine
    |> Compainie.changeset()
    |> Repo.insert()
  end
end

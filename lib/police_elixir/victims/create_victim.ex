defmodule PoliceElixir.Victims.CreateVictim do
  alias PoliceElixir.Victims.Victim
  alias PoliceElixir.Repo

  @spec execute(Victim.t()) :: {:ok, Victim.t()} | {:error, String.t()}
  def execute(victim) do
    victim
    |> Victim.changeset()
    |> Repo.insert()
  end
end

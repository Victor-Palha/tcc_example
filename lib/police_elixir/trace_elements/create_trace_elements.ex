defmodule PoliceElixir.TraceElements.CreateTraceElements do
  alias PoliceElixir.TraceElements.TraceElement
  alias PoliceElixir.Repo

  @spec execute(TraceElement.t()) :: {:ok, TraceElement.t()} | {:error, String.t()}
  def execute(trace_element) do
    trace_element
    |> TraceElement.changeset()
    |> Repo.insert()
  end
end

defmodule PoliceElixir.TraceElements.TraceElement do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
    :date_collection,
    :surface_of_collection,
    :quantity,
    :requested_exam,
    :state_of_trace,
    :register_id,
  ]

  schema "trace_elements" do
    field :date_collection, :utc_datetime
    field :surface_of_collection, :string
    field :quantity, :integer
    field :requested_exam, :string
    field :state_of_trace, :string

    belongs_to :register, PoliceElixir.Registers.Register

    timestamps()
  end

  def changeset(trace_element \\ %__MODULE__{}, params) do
    trace_element
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end

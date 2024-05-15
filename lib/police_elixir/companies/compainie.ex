defmodule PoliceElixir.Companies.Compainie do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
    :name,
    :identification,
    :function,
    :registration,
    :register_id
  ]

  schema "companies" do
    field :name, :string
    field :identification, :string
    field :function, :string
    field :registration, :string

    belongs_to :register, PoliceElixir.Registers.Register

    timestamps()
  end

  def changeset(compaine \\ %__MODULE__{}, params) do
    compaine
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end

end

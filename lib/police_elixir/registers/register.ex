defmodule PoliceElixir.Registers.Register do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields_creation [
    :type_register,
    :requester_register,
    :requesting_unit,
    :street,
    :neighborhood,
    :district,
    :date_activation,
    :crime_motivation,
    :crime_method,
    :register_was_realized,
    :isolation_local,
    :preservation_local,
    :local_coordinates,
    :local_history,
    :responsible_management
  ]

  schema "registers" do
    field :type_register, Ecto.Enum, values: [:LCC, :LCSC]
    field :number_document, :string
    field :requester_register, :string
    field :requesting_unit, :string
    field :street, :string
    field :neighborhood, :string
    field :district, :string
    field :date_activation, :date
    field :crime_motivation, :string
    field :crime_method, :string
    field :register_was_realized, :boolean
    field :case_number, :string
    field :protocol_number, :string
    field :isolation_local, Ecto.Enum, values: [:ISOLADO, :NAO_ISOLADO]
    field :preservation_local, Ecto.Enum, values: [:PRESERVADO, :NAO_PRESERVADO]
    field :date_report, :date
    field :local_coordinates, :string
    field :local_history, :string
    belongs_to :responsible_management, PoliceElixir.Users.User

    timestamps()
  end

  def changeset(register \\ %__MODULE__{}, params) do
    register
    |> cast(params, @required_fields_creation)
    |> validate_required(@required_fields_creation)
  end
end

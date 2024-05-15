defmodule PoliceElixir.Registers.Register do
  use Ecto.Schema
  import Ecto.Changeset

  @register_fields [
    :type_register,
    :number_document,
    :requester_register,
    :requesting_unit,
    :street,
    :neighborhood,
    :district,
    :date_activation,
    :crime_motivation,
    :crime_method,
    :register_was_realized,
    :case_number,
    :protocol_number,
    :isolation_local,
    :preservation_local,
    :date_report,
    :local_coordinates,
    :local_history,
    :responsible_management_id,
    :main_expert_id,
    :secondary_expert_id,
    :local_description,
    :characteristics,
    :sinal_of_break_in,
    :construction_features,
    :external_features,
    :street_features,
    :has_trace_elements,
  ]

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
    :responsible_management_id,
    :main_expert_id,
    :local_description,
    :characteristics,
    :sinal_of_break_in,
    :construction_features,
    :external_features,
    :street_features,
    :has_trace_elements,
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
    field :isolation_local, :boolean
    field :preservation_local, :boolean
    field :date_report, :date
    field :local_coordinates, :string
    field :local_history, :string
    field :responsible_management_id, :integer
    field :main_expert_id, :integer
    field :secondary_expert_id, :integer
    field :local_description, :string
    field :characteristics, :string
    field :sinal_of_break_in, :boolean
    field :construction_features, :string
    field :external_features, :string
    field :street_features, :string
    field :has_trace_elements, :boolean

    belongs_to :user, PoliceElixir.Users.User
    has_many :victims, PoliceElixir.Victims.Victim
    timestamps()
  end

  def changeset(register \\ %__MODULE__{}, params) do
    register
    |> cast(params, @register_fields)
    |> validate_required(@required_fields_creation)
  end
end

defmodule PoliceElixir.Victims.Victim do
  use Ecto.Schema
  import Ecto.Changeset

  @field_victim [
    :identification,
    :found_position,
    :cadaveric_rigidity,
    :sex_victim,
    :victim_complexion,
    :hair_size,
    :hair_color,
    :facial_hair,
    :clothing,
    :has_tattoo,
    :tattoo_description,
    :register_id
  ]

  @required_fields_creation [
    :found_position,
    :cadaveric_rigidity,
    :sex_victim,
    :has_tattoo,
    :register_id
  ]

  schema "victims" do
    field :identification, :string
    field :found_position, :string
    field :cadaveric_rigidity, :string
    field :sex_victim, Ecto.Enum, values: [:M, :F, :SI]
    field :victim_complexion, :string
    field :hair_size, :string
    field :hair_color, :string
    field :facial_hair, :string
    field :clothing, :string
    field :has_tattoo, :boolean
    field :tattoo_description, :string

    belongs_to :register, PoliceElixir.Registers.Register

    timestamps()
  end

  def changeset(victim \\ %__MODULE__{}, params) do
    victim
    |> cast(params, @field_victim)
    |> validate_required(@required_fields_creation)
  end
end

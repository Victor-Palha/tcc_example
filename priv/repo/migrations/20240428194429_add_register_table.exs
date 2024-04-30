defmodule PoliceElixir.Repo.Migrations.AddRegisterTable do
  use Ecto.Migration

  def change do
    create table(:registers) do
      add :type_register, :string
      add :number_document, :string
      add :requester_register, :string
      add :requesting_unit, :string
      add :street, :string
      add :neighborhood, :string
      add :district, :string
      add :date_activation, :date
      add :crime_motivation, :string
      add :crime_method, :string
      add :register_was_realized, :boolean
      add :case_number, :string
      add :protocol_number, :string
      add :preservation_local, :string
      add :isolation_local, :string
      add :date_report, :date
      add :local_coordinates, :string
      add :local_history, :string
      add :responsible_management, references(:users)
      timestamps()
    end

    create table(:experts_register) do
      add :register_id, references(:registers)
      add :main_expert, references(:users)
      add :secondary_expert, references(:users)
      timestamps()
    end

    create table(:companies) do
      add :name, :string
      add :identification, :string
      add :function, :string
      add :registration, :string
      add :register_id, references(:registers)
      timestamps()
    end

    create table(:victims) do
      add :indentification, :string
      add :found_position, :string
      add :cadaveric_rigidity, :string
      add :sex_victim, :string
      add :victim_complexion, :string
      add :hair_size, :string
      add :hair_color, :string
      add :facial_hair, :string
      add :clothing, :string
      add :has_tattoo, :boolean
      add :tattoo_description, :string
      add :register_id, references(:registers)
      timestamps()
    end

    create table(:location) do
      add :description, :string
      add :characteristics, :string
      add :sinal_of_break_in, :boolean
      add :construction_features, :string
      add :external_features, :string
      add :street_features, :string
      add :has_trace_elements, :boolean
      add :register_id, references(:location)
      timestamps()
    end

    create table(:trace_elements) do
      add :date_collection, :date
      add :surface_of_collection, :string
      add :quantity, :integer
      add :requested_exam, :string
      add :state_of_trace, :string
      add :register_id, references(:registers)
      timestamps()
    end
  end
end

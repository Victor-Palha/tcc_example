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
      add :preservation_local, :boolean
      add :isolation_local, :boolean
      add :date_report, :date
      add :local_coordinates, :string
      add :local_history, :string
      add :local_description, :string
      add :characteristics, :string
      add :sinal_of_break_in, :boolean
      add :construction_features, :string
      add :external_features, :string
      add :street_features, :string
      add :has_trace_elements, :boolean

      add :responsible_management_id, references(:users, on_delete: :nothing)
      add :main_expert_id, references(:users, on_delete: :nothing)
      add :secondary_expert_id, references(:users, on_delete: :nothing)
      timestamps()
    end
    create index(:registers, [:responsible_management_id])
    create index(:registers, [:main_expert_id])
    create index(:registers, [:secondary_expert_id])

    create table(:companies) do
      add :name, :string
      add :identification, :string
      add :function, :string
      add :registration, :string
      add :register_id, references(:registers)
      timestamps()
    end
    create index(:companies, [:register_id])

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
    create index(:victims, [:register_id])

    create table(:trace_elements) do
      add :date_collection, :date
      add :surface_of_collection, :string
      add :quantity, :integer
      add :requested_exam, :string
      add :state_of_trace, :string
      add :register_id, references(:registers)
      timestamps()
    end
    create index(:trace_elements, [:register_id])
  end
end

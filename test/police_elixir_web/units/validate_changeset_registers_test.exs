defmodule PoliceElixirWeb.Units.ValidChangesetRegistersTest do
  use PoliceElixirWeb.ConnCase
  alias PoliceElixir.Registers.Register

  describe "Unit - valid changeset registers" do
    test "Changeset Register" do
      params = %{
        "type_register" => "LCC",
        "number_document" => "123456",
        "requester_register" => "João Victor Ferreira Palha",
        "requesting_unit" => "DEIC",
        "street" => "Rua 1",
        "neighborhood" => "Bairro 1",
        "district" => "Distrito 1",
        "date_activation" => "2024-04-28",
        "crime_motivation" => "Motivação 1",
        "crime_method" => "Método 1",
        "register_was_realized" => true,
        "case_number" => "123456",
        "protocol_number" => "123456",
        "preservation_local" => true,
        "isolation_local" => true,
        "date_report" => "2024-04-28",
        "local_coordinates" => "1,1",
        "local_history" => "Histórico 1",
        "local_description" => "Descrição 1",
        "characteristics" => "Características 1",
        "sinal_of_break_in" => true,
        "construction_features" => "Características de construção 1",
        "external_features" => "Características externas 1",
        "street_features" => "Características de rua 1",
        "has_trace_elements" => true,
        "responsible_management_id" => 1,
        "main_expert_id" => 1,
        "secondary_expert_id" => nil
      }

      register = Register.changeset(params)
      assert register.valid? == true
    end
  end
end

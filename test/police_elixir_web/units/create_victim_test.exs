defmodule PoliceElixirWeb.Units.CreateVictim do
  use PoliceElixirWeb.ConnCase
  alias PoliceElixir.Registers.{CreateRegister, Register}
  alias PoliceElixir.Users.{CreateUser, User}
  alias PoliceElixir.Victims.{CreateVictim, Victim}

  describe "Unit - Create Victim" do
    setup do
      #To delete a user, we need to create a user first
      params = %{
        "name" => "João Victor Ferreira Palha",
        "registration" => "5965778/1",
        "password" => "12345678",
        "role" => "user"
      }

      {:ok, %User{id: id}} = CreateUser.execute(params)

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
        "responsible_management_id" => id,
        "main_expert_id" => id,
        "secondary_expert_id" => nil
      }

      {:ok, %Register{id: id}} = CreateRegister.execute(params)

      {:ok, register_id: id}
    end

    test "should be able to create a new victim", %{register_id: id} do

      expected_response = "Victim 1"

      params = %{
        "identification" => "Victim 1",
        "found_position" => "Position 1",
        "cadaveric_rigidity" => "Rigid 1",
        "sex_victim" => "M",
        "victim_complexion" => "Complexion 1",
        "hair_size" => "Size 1",
        "hair_color" => "Color 1",
        "facial_hair" => "Facial 1",
        "clothing" => "Clothing 1",
        "has_tattoo" => true,
        "tattoo_description" => "Description 1",
        "register_id" => id
      }

      {:ok, %Victim{identification: name}} = CreateVictim.execute(params)

      assert name == expected_response
    end
  end
end

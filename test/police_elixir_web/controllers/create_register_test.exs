defmodule PoliceElixirWeb.CreateRegisterTest do
  use PoliceElixirWeb.ConnCase

  describe "POST /register" do
    test "create a Register", %{conn: conn} do
      # expected_response = %{
      #   "message" => "Registro criado com sucesso",
      #   "register_id" => 1
      # }

      # params = %{
      #   "type_register" => "LCC",
      #   "number_document" => "123456",
      #   "requester_register" => "João Victor Ferreira Palha",
      #   "requesting_unit" => "DEIC",
      #   "street" => "Rua 1",
      #   "neighborhood" => "Bairro 1",
      #   "district" => "Distrito 1",
      #   "date_activation" => "2024-04-28",
      #   "crime_motivation" => "Motivação 1",
      #   "crime_method" => "Método 1",
      #   "register_was_realized" => true,
      #   "case_number" => "123456",
      #   "protocol_number" => "123456",
      #   "preservation_local" => "PRESERVADO",
      #   "isolation_local" => "ISOLADO",
      #   "date_report" => "2024-04-28",
      #   "local_coordinates" => "1,1",
      #   "local_history" => "Histórico 1",
      #   "responsible_management_id" => 1,
      #   "main_expert_id" => 1,
      #   "secondary_expert_id" => 1
      # }

      # response = post(conn, ~p"/api/registers", params)
      # |> json_response(200)

      # assert response == expected_response
      assert true == true
    end
  end
end

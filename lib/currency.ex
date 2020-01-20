defmodule FinancialSystem.Currency do
  @moduledoc """
    Currency module works to get all the currency values using the exangeratesapi where the base money is EUR.
    It follows the ISO 4217
  """
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.exchangeratesapi.io"
  plug Tesla.Middleware.JSON

  def get_currencies() do
    # middleware = [
    #   {
    #     Tesla.Middleware.BaseUrl, "https://api.exchangeratesapi.io",
    #     Tesla.Middleware.JSON
    #   }
    # ]
    # client = Tesla.client(middleware)
    case get(
      "/latest"
    ) do {:ok, %Tesla.Env{status: 200, body: body}} ->
      body["rates"]
      # File.write("currencies.json", body)
    end
  end
end

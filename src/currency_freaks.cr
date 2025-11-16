require "json"
require "http/client"

class CurrencyFreaks
  API_PATH = "v2.0"
  def initialize(@api_key : String)
    @headers = HTTP::Headers {
      "Content-Type" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://api.currencyfreaks.com")
    @http_client = HTTP::Client.new(uri)
  end

  def get_latest_rates() : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/rates/latest?apikey=#{@api_key}", headers: @headers).body)
  end

  def get_desired_rates(symbols : String) : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/rates/latest?apikey=#{@api_key}&symbols=#{symbols}", headers: @headers).body)
  end

  def get_historical_rates(date : String) : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/rates/historical?apikey=#{@api_key}&date=#{date}", headers: @headers).body)
  end
end

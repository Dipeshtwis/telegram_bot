require 'telegram/bot'
require 'net/http'
# require 'json'
require 'uri'
require 'openssl'
require_relative 'bot.rb'

class Joke
  attr_reader :joke
  def initialize
    @joke = provide_joke
  end

  def provide_joke
    url = URI('https://joke3.p.rapidapi.com/v1/joke')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['x-rapidapi-host'] = 'joke3.p.rapidapi.com'
    request['x-rapidapi-key'] = '7e13aacda5msh5c03256bcaac2dap1a2540jsn105a8383161d'

    response = http.request(request)
    puts response.read_body
  end
end
require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

class Quote
  @quote
  def initialize
    @quote = provide_quote
  end

  def provide_quote
    uri = URI('https://type.fit/api/quotes')
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end

  def choose_random
    @quote = @quote.sample
  end
end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Layout/LineLength

require 'telegram/bot'
require_relative 'quote.rb'
require_relative 'joke.rb'
class Bot
  def initialize
    token = '1290989050:AAEQZjgmkj64d2voqbECWZJVIeZMP1Mpqnk'

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}, Welcome to Deepesh chat bot, Let me help you if you are feeling down, I am here to influence you with my word and joke. \n Use /start to start the bot, \n /stop to say bye to the bot, \n /quote to get a different inspirational quote everytime you feel down, and \n /joke to listen something funny")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Sorry to see you go\nBye, #{message.from.first_name}")
        when '/quote'
          quote = Quote.new
          final_quote = quote.choose_random
          bot.api.send_message(chat_id: message.chat.id, text: "Inspirational quote :\n #{final_quote['text']} \n by #{final_quote['author']}", date: message.date)
        when '/joke'
          value = Joke.new
          final_joke = value.provide_joke
          bot.api.send_message(chat_id: message.chat.id, text: "Funny joke : \n #{final_joke['content']}", date: message.date)

        else
          bot.api.send_message(chat_id: message.chat.id, text: "Sorry you put an invalid entry, #{message.from.first_name}, you need to use  /start, /stop, /quote or /joke")
        end
      end
    end
  end
end

# rubocop: enable Metrics/MethodLength
# rubocop: enable Layout/LineLength

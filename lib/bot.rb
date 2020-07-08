require 'telegram/bot'
require_relative 'quote.rb'
class Bot
  def initialize
    token = '1290989050:AAEQZjgmkj64d2voqbECWZJVIeZMP1Mpqnk'

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Sorry to see you go\nBye, #{message.from.first_name}")
        when '/quote'
          quote = Quote.new
          final_quote = quote.choose_random
          bot.api.send_message(chat_id: message.chat.id, text: "motivational quote :\n
          	#{final_quote['text']} \n by #{final_quote['author']}", date: message.date)
        end
      end
    end
  end
end

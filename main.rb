require 'telegram/bot'
require './Raparser'

token = ''

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/n'
      text_of_message = Raparser.get_new
      bot.api.send_message(
      chat_id: message.chat.id,
      text: text_of_message
      )

    end
  end
end

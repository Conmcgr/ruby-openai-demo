require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

puts "Hello, how can I help you today?"

puts "-"*50

input = ""

message_list = []

while input != "bye" do

  input = gets.chomp
  puts "-"*50

  new_message = {"role" => "user", "content" => input}

  message_list.append(new_message)

  api_response = client.chat(
    parameters: {
      model: "gpt-3.5-turbo",
      messages: message_list
    }
  )

  response = api_response.fetch("choices")[0].fetch("message").fetch("content")

  new_response = {"role" => "system", "content" => response}
  
  message_list.append(new_response)

  puts response

  puts "-"*50
  
end

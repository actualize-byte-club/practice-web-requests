require "http"

while true

  system "clear"
  puts "Welcome to the Dictionary App!"
  puts "Enter a word:"
  word = gets.chomp

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  definitions = response.parse(:json)

  if definitions[0]["text"]
    puts "Definition: #{definitions[0]["text"]}"
  else
    puts "Definition: #{definitions[1]["text"]}"
  end

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  top_example = response.parse(:json)

  puts "Top Example: #{top_example["text"]}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  pronunciations = response.parse(:json)

  puts "Top Pronunciation: #{pronunciations[0]["raw"]}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  audios = response.parse(:json)

  system("open", audios[0]["fileUrl"])

  puts "Enter q to quit, and any other key to continue"
  input_option = gets.chomp
  if input_option == "q"
    puts "Thank you, goodbye!"
    break
  end
end
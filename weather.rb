require "http"

system "clear"
puts "Welcome to the Weather app!"
puts "Enter a city:"
city = gets.chomp

response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&appid=9beb296210c3171be00be7e99d0e7ba8")

weather_data = response.parse(:json)

temperature = weather_data["main"]["temp"]
description = weather_data["weather"][0]["description"]

puts "Today in #{city} it is #{temperature} degrees outside with #{description}."
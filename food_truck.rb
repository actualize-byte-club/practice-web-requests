require "http"

response = HTTP.get("https://data.sfgov.org/resource/jjew-r69b.json")

pp response.parse(:json)
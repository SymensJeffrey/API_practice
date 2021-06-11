system "clear"
p "Welcome to the weather app. Please enter the city:"
city_answer = gets.chomp
p "What units would you like"
units_answer = gets.chomp

if units_answer.downcase == "farenheit"
  unit = "imperial"
elsif units_answer.downcase == "celcius"
  unit = "metric"
elsif units_answer.downcase == "kelvin"
  unit = "standard"
end


require 'http'

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city_answer.downcase}&units=#{unit}&appid=#{ENV['OPEN_WEATHER_API_KEY']}")

weather_data = response.parse(:json)
temperature = weather_data['main']['temp']
description = weather_data['weather'][0]['description']
city_name = weather_data['name']

p "It is currently #{temperature} degrees #{units_answer} and #{description} in #{city_name}."


# Some features to add to your weather app:
# Ask the user for the name of a city to forecast
# Ask the user for preferred temperature units (Celcius or Farenheit)
# Write the app in a loop (once you show the forecast, the user can keep entering different cities until they choose to quit the program)

#----------------------------------

# It is currently 75 Degrees and sunny in Buffalo

# require 'http'

# response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=buffalo&appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=imperial")

# weather_data = response.parse(:json)
# temperature = weather_data['main']['temp']
# description = weather_data['weather'][0]['description']
# city_name = weather_data['name']


# system "clear"
# p "welcome to the weather app!"
# p "It is #{temperature} degrees and #{description} in #{city_name}" 

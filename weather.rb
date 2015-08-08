require 'yahoo_weatherman'

puts "Enter Location:"
location = gets.chomp

def weather(location)
	client = Weatherman::Client.new
	weather = client.lookup_by_location(location)
	forecasts = weather.forecasts

	today = Time.now.strftime('%w').to_i

	forecasts.each do |forecast|

		day = forecast['date']
		weekday = day.strftime('%w').to_i

		if (weekday == today)
			dayName = "Today"
		elsif (weekday == (today + 1))
			dayName = "Tomorrow"
		else
			dayName = day.strftime('%A')
		end				

		puts "#{dayName} is going to be #{forecast['text'].downcase} with a low of #{forecast['low'].to_s} and a high of #{forecast['high'].to_s}."
	end
end

weather(location)
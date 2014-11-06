class Forecast < ActiveRecord::Base

	validates  :location, presence: true
	attr_accessor :location, :temperature, :icon
	

	def make_weather
		weather_hash = fetch_forecast 
		weather_values(weather_hash)
	end

	def fetch_forecast(location)
		HTTParty.get("http://api.wunderground.com/api/10cfa1d790a05aa4/hourly/q/"+location+".xml")
	end

	def weather_values(weather_hash)
		hourly_forecast_response = weather_hash.parsed_response['response']['hourly_forecast']['forecast'].first
    	self.temperature = hourly_forecast_response['temp']['english']
    	self.icon = hourly_forecast_response['icon_url']
  	end

end
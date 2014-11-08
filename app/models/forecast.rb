class Forecast < ActiveRecord::Base

	validates  :location, presence: true
	attr_accessor :location, :temperature, :icon
	
	def weather
		weather_hash = self.fetch_forecast 
		weather_values(weather_hash)
		self.temperature.to_i
	end


	def fetch_forecast
		HTTParty.get("http://api.wunderground.com/api/10cfa1d790a05aa4/hourly/q/"+self.location+".xml")
	end

	def weather_values(weather_hash)
		hourly_forecast_response = weather_hash.parsed_response['response']['hourly_forecast']['forecast'][0]
    	hourly_forecast_response_later = weather_hash.parsed_response['response']['hourly_forecast']['forecast'][9]
    	temp_now = hourly_forecast_response['temp']['english']
    	temp_later = hourly_forecast_response_later['temp']['english']
    	self.temperature = temp_later.to_i - temp_now.to_i
    	self.icon = hourly_forecast_response['icon_url']
  	end

end


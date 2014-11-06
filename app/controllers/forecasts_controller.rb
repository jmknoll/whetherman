class ForecastsController < ApplicationController

	def index 
		@forecast = Forecast.new
	end

	def new
		@forecast = Forecast.new
	end

	def create
	#currently functioning as show method : / 
		@forecast = Forecast.new(forecast_params)
	end

=begin

	def show
		@forecast = Forecast.find(params[:id])
	end

=end


	private

	def forecast_params
		params.require(:forecast).permit(:location)
	end

end

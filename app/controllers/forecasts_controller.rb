class ForecastsController < ApplicationController

	def index 
		@forecast = Forecast.new
	end

	def new
		@forecast = Forecast.new
	end

	def create 
		@forecast = Forecast.new(forecast_params)
	end

	def show
		@forecast = Forecast.find(params[:id])
	end

	private

	def forecast_params
		params.require(:forecast).permit(:location)
	end

end

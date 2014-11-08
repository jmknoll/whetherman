module ForecastsHelper
	def hoodie
		if @forecast > -5
			"Weather should be nice. You don't need a hoodie."
		else
			"Definitely bring a hoodie. Its going to be cold."
		end
	end
end

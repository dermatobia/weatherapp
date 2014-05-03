require './app/helpers/weather_helper.rb'

include WeatherHelper

namespace :weather do
	desc 'populate weather info to db hourly'
	task :update => :environment do		
		update_city_condition
	end
end
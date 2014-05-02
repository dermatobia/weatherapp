require 'open-uri'
require 'json'

class CitiesController < ApplicationController

	def index
		key = ENV['WUNDERGROUND_API_KEY']
		link = 'http://api.wunderground.com/api/'+key+'/geolookup/conditions/q/NY/Brooklyn.json'
		open(link) do |f|
		  json_string = f.read
		  p parsed_json = JSON.parse(json_string)
		  location = parsed_json['location']['city']
		  temp_f = parsed_json['current_observation']['temp_f']
		  @info = {location: location, tempF: temp_f}
		  # print "Current temperature in #{location} is: #{temp_f}\n"
		end
	end
end
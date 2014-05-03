require 'open-uri'
require 'json'

include WeatherHelper

class CitiesController < ApplicationController

	def index
		@cities = City.all
	end
end
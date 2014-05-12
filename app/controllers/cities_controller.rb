require 'open-uri'
require 'json'

include WeatherHelper

class CitiesController < ApplicationController

	def index
		@cities = City.all
	end

	def show
		@city = City.find(params[:id])
		@conditions = @city.conditions.reverse
	end

end
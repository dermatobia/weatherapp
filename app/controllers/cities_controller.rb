require 'open-uri'
require 'json'

include WeatherHelper

class CitiesController < ApplicationController

	def index
		@cities = City.all
	end

	def show
		# @city = City.find(params[:id])
		# @conditions = @city.conditions.reverse
	end

	def detail
		@city = City.find(params[:id])
		@conditions = @city.conditions.reverse[0,5]
		p 'in #detail'
		respond_to do |format|
			format.js {}
		end
	end

end
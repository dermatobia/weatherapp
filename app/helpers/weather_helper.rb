require 'open-uri'
require 'json'

module WeatherHelper 

	def json_link(city, state)
		key = ENV['WUNDERGROUND_API_KEY']
		'http://api.wunderground.com/api/'+key+'/geolookup/conditions/q/'+state+'/'+city+'.json'
	end

	def update_city_condition
		cities = {
			'Brooklyn' => 'NY',
			'Boston' => 'MA', 
			'Chicago' => 'IL',
			'Austin' => 'TX'
		}

		cities.keys.each do |city| 
			link = json_link(city, cities[city])
			data = open_link(link)
			insert_db(data)
		end
	end

	def open_link(link)
		data = {}		
		open(link) do |f| 
			json_string = f.read
			parsed_json = JSON.parse(json_string)

			data['location'] = parsed_json['location']['city']
			data['state'] = parsed_json['location']['state']
			data['temp_c'] = parsed_json['current_observation']['temp_c']
			data['temp_f'] = parsed_json['current_observation']['temp_f']
			data['status'] = parsed_json['current_observation']['weather']
			data
		end
	end

	def insert_db(data)
		city = City.find_or_create_by( name: data['location'],
												state: data['state'] )

		city.conditions.create( temp_c: data['temp_c'],
														temp_f: data['temp_f'],
														status: data['status'] )
	end

end
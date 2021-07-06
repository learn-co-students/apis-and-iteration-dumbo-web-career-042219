require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)


useful_hash = response_hash["results"].find do |character_hash|
character_hash["name"].downcase == character_name
end  
useful_hash["films"]
end


def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
film_array = films.map do |film|
response_string_2 = RestClient.get(film)
JSON.parse(response_string_2)
  end 
film_array.each do |film|
  puts film["title"]
end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

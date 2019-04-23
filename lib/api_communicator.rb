require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  hash = response_hash["results"].find {|character_hash| character_hash["name"].downcase == character_name}
  hash["films"]
  # binding.pry
end

def print_movies(films)
  arr = films.map {|film| JSON.parse(RestClient.get(film))}
  binding.pry
  arr.each {|ele| puts ele["title"]}
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

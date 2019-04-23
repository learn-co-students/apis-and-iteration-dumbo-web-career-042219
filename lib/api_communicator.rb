require 'rest-client'
require 'json'
require 'pry'

def api_to_hash(api)
  string = RestClient.get(api)
  hash = JSON.parse(string)
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = 'http://www.swapi.co/api/people/'
  response_hash = api_to_hash(response_string)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

  target_character = response_hash["results"].find do |character|
    character["name"].downcase.include?(character_name)
  end
  target_character["films"].map do |links|
    movie_string = links
    movie_hash = api_to_hash(movie_string)
  end
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.map.with_index do |movie_hash, index|
    puts "#{index+1}. #{movie_hash['title']}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

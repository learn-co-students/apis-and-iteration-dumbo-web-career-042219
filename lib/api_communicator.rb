require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film

  url_array = []

  response_hash["results"].each do |result|
      if result["name"].downcase == character
        url_array = result["films"]
       end
     end

films = []

  url_array.map do |url|
    each_film_url = RestClient.get(url)
    films << JSON.parse(each_film_url)
  end

films
end





  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #

def print_movies(films)
films.each do |film_hash|
puts "#{film_hash['title']}"
 end
end


  # some iteration magic and puts out the movies in a nice list


def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

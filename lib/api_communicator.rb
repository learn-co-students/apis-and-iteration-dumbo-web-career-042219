require 'rest-client'
require 'json'
require 'pry'

def get_api(api) #output value of hash
  api_string = RestClient.get(api)
  api_hash = JSON.parse(api_string)
end

def change_page(character_name)
 for page_num in (1..9)
   url = "https://swapi.co/api/people/?search=a&page=" + "#{page_num}"
   character_hash = find_char(character_name, url)
   # character_hash is either a hash or is nil
   if character_hash != nil
     return character_hash
   end
 end
end

def find_char (character_name, url)
  response_hash = get_api(url)
  character_hash = response_hash["results"].find {|character| character["name"].downcase.include?(character_name)}
end

def get_character_movies_from_api(character_name)
  #make the web request
  # response_string = RestClient.get('http://www.swapi.co/api/people/')
  # response_hash = JSON.parse(response_string)
  response= "http://www.swapi.co/api/people/"
  response_hash = get_api(response)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  character_hash = response_hash["results"].find {|character| character["name"].downcase.include?(character_name)}

  if character_hash == nil
    character_hash=change_page(character_name)
  end
  #final = []
  final = character_hash["films"].map do |movies|
    # movies_string = RestClient.get(movies)
    # movies_hash = JSON.parse(movies_string)
    movies_hash = get_api(movies)
    movies_hash["title"]
  end
  final
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each {|movie| puts movie}
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

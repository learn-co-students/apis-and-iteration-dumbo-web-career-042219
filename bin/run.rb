#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character_name = get_character_from_user
get_character_movies_from_api(character_name)
show_character_movies(character_name)

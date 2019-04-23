def welcome
  puts "Welcome to Wei and Miles' API interface - great to see you (unless you're Andrew)!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp.downcase
end

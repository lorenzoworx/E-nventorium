require_relative 'app'

def list_options
  list = "
Please choose an option by entering a number (1-12):

1 - List all books
2 - List all music albums
3 - List all games
4 - List all genres
5 - List all labels
6 - List all authors
7 - Add a new book
8 - Add a new music album
9 - Add a new game
10 - Exit
"
  puts list
  gets.chomp
end

def main
  puts 'Welcome to Catalog manager App!'
  console = App.new
  loop do
    number = list_options

    case number
    when '1', '2', '3', '4', '5', '6', '7', '8', '9'
      console.run(number)
    when '10'
      puts 'Thank you for using this app!'
      break
    else
      puts 'Invalid input'
    end
  end
end

main

require_relative 'app'

def display_list
  action_list = {
    '1': 'List all books',
    '2': 'List all people',
    '3': 'Create a person',
    '4': 'Create a book',
    '5': 'Create a rental',
    '6': 'List all rentals for a given person id',
    '7': 'Exit'
  }
  puts "\e[33mPlease choose an option by entering a number:\e[0m"
  action_list.each do |index, command|
    puts "#{index} - #{command}"
  end
end

def main
  puts "\e[32mWelcome to the School Library App!\e[0m"
  my_app = App.new
  display_list
  my_app.continue
end

main

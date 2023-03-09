class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @person.rentals = []
    @book.rentals << self
  end
end

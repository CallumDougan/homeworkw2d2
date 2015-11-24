class Book
  attr_accessor :title, :author

  def initialize(options = {})
    @title = options[:title]
    @author = options [:author]
  end

  def fancy_string
    "#{@author}: '#{@title}'"
  end

end

class Library
  attr_accessor :name, :books, :people

  def initialize(name)
    @name = name
    @books = {}
    @people = {}
  end

  def add_book (book)
    @books[book.title] = book
  end

  def add_person (person)
    @people[person.name] = person
  end

  def list_books
    if books.empty?
      "There are no books in this library, failing in its sole function."
    else
      books_sorted = self.sort_books(@books)
      book_strings = books_sorted.map do |key, book|
        book.fancy_string
      end
      book_strings.join("\n")
    end
  end

    def list_people
      if people.empty?
        "Nobody likes this library :("
      else
        people_strings = @people.map do |key, person|
          person.fancy_string
      end
        people_strings.join("\n")
      end
    end

    def list_borrowed
      borrower_people = @people.select {|key, person| person.account.any? }.compact
      #define the set of borrowed books, pass this through library.list_books
      # binding.pry
      borrowed_books = {}
      borrower_people.each do |key, person|
        puts "Checking books for Person #{person.name}"
        person.account.each do |key, book|
          puts "Adding book #{book.title}"
          borrowed_books[key] = book
        end
      end
      final_books = self.sort_books(borrowed_books)
      book_strings = final_books.map do |key, book|
        book.fancy_string
      end
      book_strings.join("\n")
    end

    def lend(person_name, book_title)
      person = @people[person_name]
      book = @books.delete(book_title)
      person.borrow(book)
    end

    def return(name, book_title)
     book = @people[name].account.delete(book_title)
     self.add_book (book)
    end

    def sort_books (books)
      books_sorted = books.sort_by {|key, book| book.author}
      books_sorted
    end

end

class Person
  attr_accessor :name, :account

  def initialize(name)
    @name = name
    @account = {}
  end

  def borrow(book)
    @account[book.title] = book
  end

  def fancy_string
    "'#{name}' has #{@account.size} out at the moment"
  end
end
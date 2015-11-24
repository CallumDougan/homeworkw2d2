require 'pry-byebug'
require_relative 'library_objects'

#TO DO:
#1 - create books CHECK
#2 - list books CHECK
#3 - create people CHECK
#4 - list people CHECK
#5 - lend books CHECK
#6 - return book CHECK
#7 - list borrowed books CHECK

library = Library.new ('Code Clan Library')

book_1 = Book.new({title: "The Man in the High Castle", author: "Dick, Philip K."})
book_2 = Book.new({title: "Gold", author: "Asimov, Issac"})
book_3 = Book.new({title: "Use of Weapons", author: "Banks, Iain M."})
book_4 = Book.new({title: "The Quantum Thief", author: "Rajuniemi, Hannu"})
book_5 = Book.new({title: "Creation", author: "Vidal, Gore"})
book_6 = Book.new({title: "Budding Prospects", author: "Boyle, T. C."})
book_7 = Book.new ({title: "This Book is Full of Spiders", author: "Wong, David"})
book_8 = Book.new ({title: "How To Avoid Being Killed in a War Zone", author: "Braithwaite, Patricia"})

library.add_book(book_1)
library.add_book(book_2)
library.add_book(book_3)
library.add_book(book_4)
library.add_book(book_5)
library.add_book(book_6)
library.add_book(book_7)
library.add_book(book_8)

puts "Full book list: \n\n#{library.list_books}"
puts "\n\n\n\n"

barry = Person.new("Barry")
library.add_person(barry)
library.add_person(Person.new('Fred'))
library.add_person(Person.new('Wilma'))
library.add_person(Person.new('Barney'))
library.add_person(Person.new('Betty'))
puts library.list_people

puts "\n\n\n\n"
puts "Wilma borrows a book."
library.lend("Barry", "The Man in the High Castle")
library.lend("Wilma","This Book is Full of Spiders")
puts "New lending status is: \n#{library.list_people}\n\n"
puts "Borrowed books list is: \n#{library.list_borrowed}\n\n"
puts "Wilma returns her book:"
library.return("Wilma","This Book is Full of Spiders")

puts library.list_people
library.list_books

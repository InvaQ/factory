require_relative "factory.rb"

person = Factory.new(:first_name, :last_name, :age)
book = Factory.new(:name, :author, :price)

person1 = person.new("John", "Smith", 20)
person2 = person.new("John", "Smith", 20)
person3 = person.new("Bob", "Dylan", 13)

book1 = book.new("The Lathe of Heaven", "Pearline Herzog", 29)

 p "members" 
 p person1.members
  p "________________________"
 p "values" 
 p person1.values
 p person3.values
 p "________________________"
 p "==" 
 p person1 == person2
 p person1 == person3
 p person1 == book1
 p person1[:last_name]
 p person1[-1]
  p "________________________"
 p "values_at" 
 p book1.values_at(:name, -1)



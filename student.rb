require_relative 'crud'

class Student
  include Crud
  attr_accessor :first_name, :last_name, :email, :username, :password

  def initialize(firstname, lastname, username, emaiil, password)
    @first_name = firstname
    @last_name = lastname
    @username = username
    @email = email
    @password = password
  end

  def to_s
    "First name: #{@first_name}, Last name: #{@last_name},
    User name: #{@user_name}, email address: #{@email}"
  end


end

alex = Student.new("Alex", "Britcliffe", "Alex1", "Alex@example.com",
                  "password1" )

john = Student.new("john", "smith", "john1", "john@example.com",
                  "password2" )

hashed_password = alex.create_hash_digest(alex.password)

puts hashed_password

#line 29 will borrow the crud functionality for purposes of the student data
#in student.rb file

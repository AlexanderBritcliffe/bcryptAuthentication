
module Crud
require 'bcrypt'
puts "Module CRUD activated"

#think of modules as toolkits!

  def create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  # above code comes up with the hash version of password

  def verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  #lines 14-16 --user is going to enter password
  #and then this method is called to verify if the password is correct

  def create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_of_users
  end

  # each record is called user_record---line 21 grabs eachs users
  #password and creates hash version password

  # line 23 returns the list_of_users with hash version
  #password unlike in line 20 when it is string password


  def authenticate_user(username, password, list_of_users)
    list_of_users.each do |user_record|
      if user_record[:username] == username && verify_hash_digest
        (user_record[:password]) == password
        return user_record
      end
    end
    "Credentials were not correct"
  end
end

#line 37-38 if individual user records username is equal to
#the username that is passed in (which is represented by the
#username in argument of authenticate_user) and verify_hash_digest
#and user_record password is equal to the string password that is passed in

#if all that is the case return user record ----line 39

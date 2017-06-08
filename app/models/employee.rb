class Employee
  attr_accessor :id, :first_name, :last_name, :email, :birthday
  def initialize(hash_options)
    @id = hash_options["id"]
    @first_name = hash_options["first_name"]
    @last_name = hash_options["last_name"]
    @email = hash_options["email"]
    @birthday = hash_options["birthday"]
  end
end
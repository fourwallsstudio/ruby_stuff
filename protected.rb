class User

  def initialize(age)
    @age = age
  end

  def older_than?(other_user)
    age > other_user.age
  end

  # private
  protected

    def age
      @age
    end
end

u1 = User.new(25)
u2 = User.new(20)

puts u1.older_than? u2

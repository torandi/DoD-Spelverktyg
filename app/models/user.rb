class User < ActiveRecord::Base
  has_many :characters
  acts_as_authentic

  def admin?
    role == "admin"
  end

  def to_s
    login
  end
end

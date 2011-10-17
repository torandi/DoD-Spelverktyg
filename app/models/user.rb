class User < ActiveRecord::Base
  acts_as_authentic

  def admin?
    role == "admin"
  end
end

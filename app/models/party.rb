class Party < ActiveRecord::Base
  has_many :characters
  belongs_to :gameleader, :class_name=>"User"

end

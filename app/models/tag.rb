class Tag < ActiveRecord::Base
  has_many :releases
end


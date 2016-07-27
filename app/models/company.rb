class Company < ActiveRecord::Base
  has_many :releases
  has_many :notes
end

class Note < ActiveRecord::Base
  belongs_to :release
  belongs_to :company

  has_many :tags
end

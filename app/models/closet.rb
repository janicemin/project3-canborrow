class Closet < ActiveRecord::Base
  belongs_to :user
  has_many :garments
end

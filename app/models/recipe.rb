class Recipe < ApplicationRecord
  has_one :user
  has_one :profile

end

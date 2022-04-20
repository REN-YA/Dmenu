class Store < ApplicationRecord
  has_secure_password
   has_many :genres , dependent: :destroy
   has_many :categories , dependent: :destroy
   has_many :drinks , dependent: :destroy

end

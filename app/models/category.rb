class Category < ApplicationRecord
  has_many :genres , dependent: :destroy
  has_many :drinks , dependent: :destroy
  belongs_to :store
end

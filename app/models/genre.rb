class Genre < ApplicationRecord
  belongs_to :store
  belongs_to :category
  has_many :drinks , dependent: :destroy
end

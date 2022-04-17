class Drink < ApplicationRecord
  belongs_to :store
  belongs_to :category
  belongs_to :genre
end

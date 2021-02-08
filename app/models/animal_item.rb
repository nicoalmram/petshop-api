class AnimalItem < ApplicationRecord
  belongs_to :item
  belongs_to :animal
end

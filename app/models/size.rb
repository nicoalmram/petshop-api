class Size < ApplicationRecord
    has_many :size_items
    has_many :items, through: :size_items
    validates :title, presence: true, length: { in: 3..12 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}, uniqueness: true
    validates :color, presence: true, exclusion: { in: %w(FFFFFF ffffff), message: "white it's disable" }
end

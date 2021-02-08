class Category < ApplicationRecord
    has_many :category_items
    has_many :items, through: :category_items
    validates :title, presence: true, length: { in: 3..20 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}, uniqueness: true
    validates :color, presence: true, exclusion: { in: %w(FFFFFF ffffff), message: "white it's disable" }
end

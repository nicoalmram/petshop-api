class Animal < ApplicationRecord
    has_many :animal_items
    has_many :items, through: :animal_items
    has_one_attached :banner
    validates :title, presence: true, length: { in: 3..12 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}, uniqueness: true
    validates :color, presence: true, exclusion: { in: %w(FFFFFF ffffff), message: "white it's disable" }
    validates :banner, presence: true #format:  { with: /\A.+[.][png|jpg]\z/}
end

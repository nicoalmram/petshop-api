class Item < ApplicationRecord
    has_many :category_items, dependent: :delete_all
    has_many :animal_items, dependent: :delete_all
    has_many :size_items, dependent: :delete_all
    has_many :categories, through: :category_items
    has_many :animals, through: :animal_items
    has_many :sizes, through: :size_items
    has_one_attached :image
    attr_accessor :category_elements, :animal_elements, :size_elements

    validates :name, presence: true, length: { in: 3..30 }, format: { with: /\A(\w+\s*\w+)+\z/, message: "Not symbols"}, uniqueness: true
    #validates :description, presence: true, length: { in: 2..280 }, format: { with: /\A(\w+\s*\w+)+\z/, message: "Not symbols"}
    validates :price, presence: true, numericality: { greater_than: 1 }
    validates :stock, presence: true, numericality: { greater_than: 0, only_interger: true }
    #validates :category_elements, presence: true
    #validates :animal_elements, presence: true
    #validates :size_elements, presence: true

    def save_info
        save_categories
        save_animals
        save_sizes
    end

    def save_categories
        return category_items.destroy_all if category_elements.nil? || category_elements.empty?
        category_items.where.not(category_id: category_elements).destroy_all
        category_elements.each do |category_id|
            CategoryItem.find_or_create_by(item:self, category_id:category_id)
        end
    end

    def save_animals
        return animal_items.destroy_all if animal_elements.nil? || animal_elements.empty?
        animal_items.where.not(animal_id: animal_elements).destroy_all
        animal_elements.each do |animal_id|
            AnimalItem.find_or_create_by(item:self, animal_id:animal_id)
        end
    end

    def save_sizes
        return size_items.destroy_all if size_elements.nil? || size_elements.empty?
        size_items.where.not(size_id: size_elements).destroy_all
        size_elements.each do |size_id|
            SizeItem.find_or_create_by(item:self, size_id:size_id)
        end
    end

end

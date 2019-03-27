class ProductType < ActiveRecord::Base
    has_many :products
    validates :price, :name, :pr_type, presence: true
end
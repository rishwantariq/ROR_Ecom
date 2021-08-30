class Category < ApplicationRecord
    has_many :products, dependent: :destroy
    belongs_to :user

    accepts_nested_attributes_for :user

    # accepts_nested_attributes_for :product
    
end

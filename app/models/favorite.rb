class Favorite < ApplicationRecord
    serialize :favorite, Hash
    validates :name, presence: true
end

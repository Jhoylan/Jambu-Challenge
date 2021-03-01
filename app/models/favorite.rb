class Favorite < ApplicationRecord
    serialize :favorite, Hash
end

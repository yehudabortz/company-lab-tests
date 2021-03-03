class Admin < ApplicationRecord
    belongs_to :company
    belongs_to :lab
end

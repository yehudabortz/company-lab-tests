class Test < ApplicationRecord
    belongs_to :company
    belongs_to :lab, optional: true
    belongs_to :user, optional: true

end

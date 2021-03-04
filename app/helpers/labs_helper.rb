module LabsHelper
    def lab_admin?
        current_user.belongs_to_lab
    end
end
